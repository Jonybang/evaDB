collection @contacts
attributes :id, :name
child(:user) { attributes :id, :name }
