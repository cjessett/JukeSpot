# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_juke-spot_session',
                                                      domain: Rails.env.development? ? 'localhost' : 'juke-spot.herokuapp.com'
