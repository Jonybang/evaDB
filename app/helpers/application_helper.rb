module ApplicationHelper
   def uni_link(employer, name)
      @obj = employer.send(name.to_sym)
      if(!@obj)
         return ''
      end

      @url = ''
      @name = ''
      if(name == "link" && @obj.url)
         @url = @obj.url
         @name = @obj.url.sub(/^https?:\/\//, "")
         return link_to(@name, @url, target: "_blank")
      end

      @refference = employer.class.reflect_on_association(name.to_sym).macro.to_s
      if(@refference  == 'has_one' || @refference  == 'belongs_to' || @refference  == 'embedded_in')
         # if(name == "organization")
         #    return @obj.class
         # end
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
               @result += link_to(item.name, item)+ "<br />".html_safe
         end
         return @result.html_safe
      end

   end

   def uni_ref_input(form, name, obj)
      @nesteded = ['faculties', 'specialties', 'project_tasks', 'socnet_links']

      @refference = form.object.class.reflect_on_association(name.to_sym).macro.to_s
      if (@refference  == 'embeds_one' || @refference  == 'has_one')
         return ('<div class="well well-sm">' + form.fields_for(name.to_sym, obj) + '</div>').html_safe
      elsif (@refference  == 'embeds_many' || @nesteded.detect {|i| i == name } )
         return ('<div class="well well-sm">' + form.fields_for(name.to_sym, obj) + form.link_to_add("Add a " + name, name.to_sym) + '</div>').html_safe
      else
         return form.association(name.to_sym, include_blank: true)
      end
   end

   def uni_info(employer, name)
      @obj = employer.send(name.to_sym)
      # begin
      #    @obj = employer.send(name.to_sym)
      # rescue Mongoid::Errors::MixedRelations => e
      #    return 1
      # end
      if(!@obj || @obj.class == NilClass)
         return ''
      end
      # if(employer.class.field(name).kind_of? String )
      #    return "1"
      # end

      @refference = employer.class.reflect_on_association(name.to_sym).macro.to_s
      if (@refference  == 'embeds_one')

         @result = ''
         @obj.instance_variable_get('@attributes').each do |prop|
            if(prop[0] != "_id")
               @result += "<strong>" + prop[0] + "</strong>: " + prop[1] + "<br/>"
            end
         end
         return ("<pre>" + @result.html_safe + "</pre>").html_safe
      elsif (@refference  == 'embeds_many')
         @result = ''

         @obj.each do |item|
            @result += item.name + ", "
         end
         return @result[0..-3].html_safe
      else
         return uni_link(employer, name)
      end
   end

   def uni_input(form, name)

      if (name == "phone")
         return form.input(name.to_sym, input_html: {class: 'bfh-phone', minlength: 16, type: 'tel', data: {format: '8 (ddd) ddd-dddd'}})
      elsif (name == "email")
         return form.input(name.to_sym, input_html: {:type => 'email'})
      elsif (name.include? "date")
         return form.input(name.to_sym, input_html: {class: 'droplist date', type: 'date'})
      elsif (name == "url" || name == "doclink" )
         return form.input(name.to_sym, input_html: {type: 'url'})
      else
         return form.input(name.to_sym)
      end
   end

   def beauty_string(employer, name, mode = "normal")
      @obj = employer.send(name.to_sym)
      if(!@obj)
         return ''
      end
      if((name.include? "link") || (name.include? "url"))
         return link_to(@obj.sub(/^https?:\/\//, "").sub(/^www./, "").gsub(/\/$/, ''), @obj, target: "_blank")
      end
      if(name.include? "date")
         return mode == "min" ? @obj.strftime("%d.%m.%Y") : @obj.strftime("%d %B %Y")
      end

      return @obj
   end
end
