module ApplicationHelper
   def uni_link(employer, name)
      @obj = employer.send(name.to_sym)
      return '' unless @obj

      if(name == "link" && @obj.url)
         return link_to(cut_url(@obj.url), @obj.url, target: "_blank")
      elsif(name == "socnet_links")
         @result = ''

         @obj.each do |item|
            @result += link_to(cut_url(item.url), item.url, target: "_blank") + "<br />".html_safe
         end
         return @result.html_safe
      end

      @refference = employer.class.reflect_on_association(name.to_sym).macro.to_s
      if(@refference  == 'has_one' || @refference  == 'belongs_to' || @refference  == 'embedded_in')
         @url = @obj
         @name = @obj.name

         begin
            if(@obj.polymorphic)
               @url = polymorphic_path(@obj)
            end
         rescue NoMethodError => e
         end
         return link_to(@name, @url)
      end

      if (@refference  == 'has_many' || @refference  == 'has_and_belongs_to_many')
         @result = ''
         @obj.each do |item|
            item_name = item.name
            item_url = item
            if(nested_resources[name.to_sym])
               item_url = nested_resources[name.to_sym][:actions].call(:show, employer, item)
            end
            @result += link_to(item_name, item_url) + "<br />".html_safe
         end
         return @result.html_safe
      end

   end

   def uni_ref_input(form, name, obj = {})
      @nesteded = ['faculties', 'specialties', 'project_tasks', 'socnet_links', 'resources']

      @refference = form.object.class.reflect_on_association(name.to_sym).macro.to_s
      if (@refference  == 'embeds_one' || @refference  == 'has_one')
         return ('<div class="well well-sm">' + form.fields_for(name.to_sym, obj) + '</div>').html_safe
      elsif (@refference  == 'embeds_many' || @nesteded.detect {|i| i == name } )
         return ('<div class="well well-sm">' + form.fields_for(name.to_sym, obj) + form.link_to_add("Add a " + name, name.to_sym) + '</div>').html_safe
      else
         return form.association(name.to_sym, include_blank: true, input_html: {class: "eva-select"})
      end
   end

   def uni_info(employer, name)
      @obj = employer.send(name.to_sym)
      if(!@obj || @obj.class == NilClass)
         return ''
      end

      @refference = employer.class.reflect_on_association(name.to_sym).macro.to_s
      if (@refference  == 'embeds_one')
         return ("<pre>" + print_all_props(@obj).html_safe + "</pre>").html_safe
      elsif (@refference  == 'embeds_many')
         @result = ''

         @obj.each do |item|
            @result += print_all_props(item) + "<hr>".html_safe
         end
         return ("<pre>" + @result[0..-5] + "</pre>").html_safe
      else
         return uni_link(employer, name)
      end
   end

   def uni_input(form, name, type="input")

      if (name == "phone")
         return form.input(name.to_sym, input_html: {class: 'bfh-phone', minlength: 16, type: 'tel', data: {format: '8 (ddd) ddd-dddd'}})
      elsif (name == "email")
         return form.input(name.to_sym, input_html: {:type => 'email'})
      elsif (name.include? "date")
         return form.input(name.to_sym, input_html: {class: 'droplist date', type: 'date'})
      elsif (name == "url" || name == "doclink" )
         return form.input(name.to_sym, input_html: {type: 'url'})
      elsif (type == "text_area")
         return form.input(name.to_sym, as: "text")
      elsif (name == "color")
         #return select form.object.name.downcase, name.to_sym, enum_option_pairs(form.object.class, name.to_sym)
         return form.input(name.to_sym,:collection => enum_option_pairs(form.object.class, name.to_sym),:include_blank => true)
      else
         return form.input(name.to_sym)
      end
   end

   def beauty_string(employer, name, mode = "normal")
      @obj = employer.send(name.to_sym)
      return unless @obj

      if((name.include? "link") || (name.include? "url"))
         return link_to(cut_url(@obj), @obj, target: "_blank")
      end
      if(name.include? "date")
         return mode == "min" ? @obj.strftime("%d.%m.%Y") : @obj.strftime("%d %B %Y")
      end

      return @obj
   end

   def cut_url(url)
      return url.sub(/^https?:\/\//, "").sub(/^www./, "").gsub(/\/$/, '')
   end

   def print_all_props(obj)
      @result = ''
      @array = obj.instance_variable_get('@attributes')
      @array.each do |prop|
         if((prop[0] == "_id") || (prop[0].include? "url"))
            next
         end

         if(prop[0] == "name" && @array.any? { |el| el[0].include? "url" } )
            @result += "<strong>" + prop[0] + "</strong>: " + link_to(prop[1], @array.find { |el| el[0].include? "url" }[1]) + "<br/>"
         else
            @result += "<strong>" + prop[0] + "</strong>: " + prop[1] + "<br/>"
         end
      end
      return @result[0..-6]
   end
   def nested_resources
      return {project_tasks: {actions: Proc.new {|action, employer, item|
                                 if(action == :show)
                                    project_project_task_url(employer, item)
                                 elsif(action == :edit)
                                    edit_project_project_task_path(employer, item)
                                 elsif(action == :new)
                                    new_project_project_task_path(employer)
                                 elsif(action == :index)
                                    project_url(employer) + '/project_tasks'
                                 end
                              }, employer: "project"}

             }
   end

   def project_task_path(project_task)
      return project_project_task_path(project_task.project, project_task)
   end
   def contact_path(contact)
     if contact.is_a?(Student)
       return student_path(contact)
     elsif contact.is_a?(Partner)
       return partner_path(contact)
     elsif contact.is_a?(Scientist)
       return scientist_path(contact)
     else
       return contact_url(contact)
     end
   end
   def uni_path(employer, name, method_name, obj = {})
      action = nil
      if(method_name.downcase.include? "new")
         action = :new
      elsif(method_name.downcase.include? "edit")
         action = :edit
      elsif(method_name.downcase.include? "s_path")
         action = :index
      end

      if(nested_resources[name.to_sym])
         # employer = obj.send(nested_resources[name.to_sym].employer)
         return nested_resources[name.to_sym][:actions].call(action, employer, obj)
      else
         if(action == :edit)
            return send(method_name, [obj])
         else
            return send(method_name)
         end
      end
   end
end
