require 'test_helper'

class EventDataControllerTest < ActionController::TestCase
  setup do
    @event_datum = event_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_datum" do
    assert_difference('EventDatum.count') do
      post :create, event_datum: { event_id: @event_datum.event_id, tracked_at: @event_datum.tracked_at }
    end

    assert_redirected_to event_datum_path(assigns(:event_datum))
  end

  test "should show event_datum" do
    get :show, id: @event_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_datum
    assert_response :success
  end

  test "should update event_datum" do
    patch :update, id: @event_datum, event_datum: { event_id: @event_datum.event_id, tracked_at: @event_datum.tracked_at }
    assert_redirected_to event_datum_path(assigns(:event_datum))
  end

  test "should destroy event_datum" do
    assert_difference('EventDatum.count', -1) do
      delete :destroy, id: @event_datum
    end

    assert_redirected_to event_data_path
  end
end
