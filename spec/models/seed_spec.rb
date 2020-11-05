require 'rails_helper'
describe Seed do
  before do
    @seed = FactoryBot.build(:seed)
  end


  describe '募集投稿機能' do
    context '募集投稿がうまくいくとき' do
      it 'title,tag_id,idea,imageが存在すれば登録できる' do
        expect(@seed).to be_valid
      end
      it 'imageが空でも登録できる' do
        @seed.image = nil
        expect(@seed).to be_valid
      end
    end

    context '募集投稿がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @seed.title = nil
        @seed.valid?
        expect(@seed.errors.full_messages).to include("Title can't be blank")
      end
      it 'tag_idが--では登録できない' do
        @seed.tag_id = 1
        @seed.valid?
        expect(@seed.errors.full_messages).to include('Tag must be other than --')
      end
      it 'ideaが空では登録できない' do
        @seed.idea = nil
        @seed.valid?
        expect(@seed.errors.full_messages).to include("Idea can't be blank")
      end
      
    end
  end
end
