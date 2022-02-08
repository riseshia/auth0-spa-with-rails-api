import Link from 'next/link'

import React, { useState, FC } from 'react';
import { useUser, UserProfile } from '@auth0/nextjs-auth0';

type AppMetadata = {
  external_id: number
};

type CustomUserProfile = UserProfile & {
  "https://some-host.com/app_metadata": AppMetadata
}

const NavBar: FC = () => {
  const { user, isLoading } = useUser();

  return (
    <>
      {!isLoading && !user && (
        <Link href="/api/auth/login">
          <a>
            Log in
          </a>
        </Link>
      )}
      {user && (
        <>
          UserID: {(user as CustomUserProfile)["https://some-host.com/app_metadata"].external_id}
          <br/>
          Email: {user.name}
          <br/>
          <Link href="/api/auth/logout">
            <a>
              Log out
            </a>
          </Link>
        </>
      )}
    </>
  );
};

export default NavBar;
