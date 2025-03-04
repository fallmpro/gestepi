export enum UserType {

    ADMIN = "1",
    USER = "2",
    MANAGER = "3",
}

export interface User {
    id: number;
    firstName: string;
    lastName: string;
    type: UserType
    phone?: string;
    mail?: string;
}
