module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-dismissable">
      <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end

          # <% flash.each do |name, msg| %>
          #     <% if msg.class == Array %>
          #         <% msg.each do |message| %>
          #             <div class="alert alert-danger alert-dismissable">
          #                 <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
          #                 <%= content_tag :div, message, :id => "flash_#{name}" %>
          #             </div>
          #         <% end %>
          #     <% else %>
          #         <div class="alert alert-danger alert-dismissable">
          #             <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
          #             <%= content_tag :div, msg, :id => "flash_#{name}" %>
          #         </div>
          #     <% end %>
          # <% end %>