module PostsHelper
  
  def excerpt post, length=150, read_more_text="(read more)"
      raw(truncate(post.body, 
      :length => 200, 
      :omission => "... #{link_to read_more_text, polymorphic_path(post)}"))      
  end

end
