ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel I18n.t("shohisha.admin.provider.recent") do
          ul do
            Provider.recent.map do |p|
              li p.name
            end
          end
        end
      end
      column do
        panel I18n.t("shohisha.admin.consumer.recent") do
          ul do
            Consumer.recent.map do |c|
              li c.name
            end
          end
        end
      end
      column do
        panel I18n.t("shohisha.admin.fetcher.recent") do
          ul do
            Fetcher.recent.map do |f|
              li f.provider.name
            end
          end
        end
      end
    end
  end # content
end
