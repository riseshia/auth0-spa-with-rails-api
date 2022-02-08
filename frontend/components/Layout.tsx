import { FC } from 'react'

import Head from 'next/head';

import NavBar from './NavBar';

const Layout: FC = ({ children }) => (
  <>
    <Head>
      <title>Next.js Sample App</title>
    </Head>
    <main id="app" className="d-flex flex-column h-100" data-testid="layout">
      <NavBar />
      <br/>

      {children}
    </main>
  </>
);

export default Layout;
