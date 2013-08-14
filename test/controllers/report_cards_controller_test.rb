require 'test_helper'

class ReportCardsControllerTest < ActionController::TestCase
  setup do
    @report_card = report_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_card" do
    assert_difference('ReportCard.count') do
      post :create, report_card: { UID: @report_card.UID }
    end

    assert_redirected_to report_card_path(assigns(:report_card))
  end

  test "should show report_card" do
    get :show, id: @report_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_card
    assert_response :success
  end

  test "should update report_card" do
    patch :update, id: @report_card, report_card: { UID: @report_card.UID }
    assert_redirected_to report_card_path(assigns(:report_card))
  end

  test "should destroy report_card" do
    assert_difference('ReportCard.count', -1) do
      delete :destroy, id: @report_card
    end

    assert_redirected_to report_cards_path
  end
end
