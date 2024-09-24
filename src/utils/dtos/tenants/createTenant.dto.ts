import { Gender } from "../gender";

export interface createTenantDto {
    name: string;
    email: string;
    phone_number: string;
    date_of_birth?: string;
    gender: Gender;
    profile_image_url: string;
}