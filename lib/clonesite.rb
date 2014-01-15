require 'httparty'

module CloneSite

  class Clone
    include HTTParty
    include Rails.application.routes.url_helpers

    attr_reader :nodes

    def clone (site)

      create
      # Create dependency graph for models
      #graph = Graph.new
      #graph.create

      # Get list of models in load order, so dependencies are fullfilled
      #list = graph.handle_order
      list = handle_order

      # Delete all current records
      list.each do |model|
        model.all.each do |record|
          record.delete
        end
      end

      # Fetch the list of records for each model from site that we are cloning
      list.each do |model|
        # Create url which will get the records from the site
        url = polymorphic_url([:rest, model], :host => site, :format => :json )
        response = HTTParty.get(url)
        records = JSON.parse(response.body)
        records.each do |record|
          new_record = model.new()
          # In order to avoid mass assignment of protected attributes it assign
          # each attribute through this loop.
          record.keys.each do |key|
            new_record.send(key+'=', record[key]) unless key == 'password'
          end
          begin
            new_record.save!
          rescue StandardError => e
            puts "Failed to save #{model}: #{e.message}"
          end
        end
      end
    end

    private

    def create
      @nodes = {}
      ActiveRecord::Base.connection.tables.map{|x|x.classify.safe_constantize}.
          compact.each do |model|
        @nodes[model] ||= Node.new(model)
        model.reflect_on_all_associations(:belongs_to).each do |assoc|
          @nodes[assoc.klass] ||= Node.new(assoc.klass)
          @nodes[model].depends_on(@nodes[assoc.klass])
        end
      end
    end

    def handle_order
      list = @nodes.keys
      used = Hash.new
      result = Array.new
      while list.count > 0
        list.each do |key|
          node = @nodes[key]
          if node.dependencies.count > 0
            all_used = 1
            node.dependencies.each do |depend|
              all_used = 0 unless used.has_key?(depend.name)
            end
            if all_used == 1
              used[node.name] = 1
              result << node.model
              list.delete(key)
            end
          else
            used[node.name] = 1
            result << node.model
            list.delete(key)
          end
        end
      end
      result
    end

  end

  class Node
    attr_reader :model

    def initialize(model)
      @model = model
      @dependencies = []
    end

    def name
      @model.name
    end

    def depends_on node
      node = Node.new(node) unless node.respond_to? :name
      @dependencies << node
    end

    def dependencies
      @dependencies
    end
  end
end

