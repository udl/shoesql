Shoes.app do
  title 'ShoeSQL'
  background darkgray
  image 'logo.jpg'
  @edit_box = edit_box('Insert SQL', width: 596, height: 200)

  @paragraph = para 'Hallo'
  button('Format') do
    # TODO make the magic happen
    @paragraph.text = @edit_box.text
  end
end
