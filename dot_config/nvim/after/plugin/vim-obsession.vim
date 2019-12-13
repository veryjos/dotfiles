if exists("create_session")
  execute "Obsession" .create_session
  unlet create_session
endif

if exists("load_session")
  execute "source" .load_session
  unlet load_session
endif
