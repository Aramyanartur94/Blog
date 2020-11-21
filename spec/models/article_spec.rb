require "rails_helper"

describe Article do
  
  describe "validations" do
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
  end
  
  describe "associations" do
  it { should have_many :comments }
  end
  
  describe "#subject" do
    it "returns the article title" do
      # Создаем объект article хитрым способом

      article = create(:article, title: 'Lorem Ipsum')
      
      # assert - проверка
      expect(article.subject).to eq 'Lorem Ipsum'

    end
  end

  describe "#last_comment" do
    it "return the last comment"do
     #создает статью, но в этот раз с комментариями
     article = create(:article_with_comments)

     # проверка
     expect(article.last_comment.body).to eq "Comment body 3"
    end
  end

end