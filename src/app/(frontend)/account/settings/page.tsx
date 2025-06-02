import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import SettingsWrapper from './settings-wrapper';

/**
 * Account Settings Page (Server Component)
 * 
 * Renders the account settings interface with profile and password management
 * wrapped in a client component wrapper for proper client-side dynamic imports.
 */
export default function SettingsPage() {
  return (
    <Gutter>
      <SettingsWrapper />
    </Gutter>
  );
}
