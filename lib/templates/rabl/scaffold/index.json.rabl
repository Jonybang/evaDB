collection @<%= plural_table_name %>
attributes <% attributes.each do |attribute| -%>:<%= attribute.name %><% if s != @stuff.last -%>,<% end -%> <% end -%>
