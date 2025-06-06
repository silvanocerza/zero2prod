use actix_web::{web, HttpResponse, Responder};
use serde::Deserialize;

#[derive(Deserialize)]
pub struct SubscribeFormData {
    name: String,
    email: String,
}

pub async fn subscribe(form: web::Form<SubscribeFormData>) -> impl Responder {
    HttpResponse::Ok()
}
