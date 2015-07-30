require 'test_helper'

class CakeAttachmentsControllerTest < ActionController::TestCase
  setup do
    @cake_attachment = cake_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cake_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cake_attachment" do
    assert_difference('CakeAttachment.count') do
      post :create, cake_attachment: { cake_id: @cake_attachment.cake_id, image: @cake_attachment.image }
    end

    assert_redirected_to cake_attachment_path(assigns(:cake_attachment))
  end

  test "should show cake_attachment" do
    get :show, id: @cake_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cake_attachment
    assert_response :success
  end

  test "should update cake_attachment" do
    patch :update, id: @cake_attachment, cake_attachment: { cake_id: @cake_attachment.cake_id, image: @cake_attachment.image }
    assert_redirected_to cake_attachment_path(assigns(:cake_attachment))
  end

  test "should destroy cake_attachment" do
    assert_difference('CakeAttachment.count', -1) do
      delete :destroy, id: @cake_attachment
    end

    assert_redirected_to cake_attachments_path
  end
end
