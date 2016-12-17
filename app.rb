Shoes.app(:resizable => false, :title => "NarWord") do
	@older_action = ""
  background gradient("#2C5679", "#000000")
  title("NarWord", :stroke => white, :kerning => 2, :align => "center")
  para("Simple and faster editor", :stroke => white, :align => "center", :top => 50 )
  @icons = flow(:displace_top => 10, :center => true) do
  #events	
	open_file = Proc.new do
		@filename = ask_open_file
		@file = File.open(@filename)
		@file.each_line do |line|
			@form.text = line
		end
	end

	save_file = Proc.new do
		@path = ask_save_file
		@text = @form.text
		save = File.open(@path, "w")
		save.write(@text)
		save.close
	end

	clear_text = Proc.new do
		@older_action = @form.text
		@form.text = ""
	end

	redo_text = Proc.new do
		@form.text = @older_action
	end

  	background black
  	image("icons/edit-undo.png", :width => 30, :height => 30, :left => 220, :click => clear_text )
  	image("icons/edit-redo.png", :width => 30, :height => 30, :left => 260, :click => redo_text )
  	image("icons/edit-find.png", :width => 30, :height => 30, :left => 300, :click => open_file )
  	image("icons/document-new.png", :width => 30, :height => 30, :left => 340, :click => save_file )    
  end
  @slot_one = stack(:width => 600, :height => 400, :displace_top => 10) do
      @form = edit_box(:width => 600, :height => 600)
  end
end