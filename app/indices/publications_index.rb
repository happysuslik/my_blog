ThinkingSphinx::Index.define :publication, with: :active_record do
	#fields
  indexes title, sortable: true
  indexes description
  indexes user.email, as: :author_email, sortable: true
	
	#attributes
	has user_id, created_at, updated_at
end