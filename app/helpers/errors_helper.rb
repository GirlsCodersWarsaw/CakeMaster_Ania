module ErrorsHelper
  def resource_errors_for(resource, field)
    if resource.errors[field].any?
      content_tag(:ul, :class => "error") do
        resource.errors[field].each do |msg|
          concat content_tag(:li,msg)
        end
      end
    end
  end
end


