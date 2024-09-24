import { NextFunction, Request, Response } from 'express';
import prisma from '../utils/prismaClient';
import { createTenantDto } from '../utils/dtos/tenants/createTenant.dto';
import { stat } from 'fs';

export const createTenant = async (req: Request, res: Response, next: NextFunction) => {
    const { name, email, phone_number, date_of_birth, gender, profile_image_url }: createTenantDto = req.body;
    try {
        const tenant = await prisma.tenant.create({
            data: {
                name,
                email,
                phone_number,
                date_of_birth: date_of_birth ? new Date(date_of_birth) : null,
                gender,
                profile_image_url,
            },
        });
        res.status(201).json({
            message: 'Tenant created successfully',
            data: tenant,
            status: 'success',
        });
    } catch (error) {
        next(error);
    }
};