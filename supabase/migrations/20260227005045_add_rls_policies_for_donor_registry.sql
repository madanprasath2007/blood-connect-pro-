/*
  # Security Enhancement: RLS Policies for Donor Registry

  ## Changes Made
  
  1. **RLS Policies for `redconnect pro` table**
     - Added SELECT policy for authenticated users to view all donor records
     - Added INSERT policy for authenticated users to create new donor records
     - Added UPDATE policy for authenticated users to update donor records
     - Added DELETE policy for authenticated users to remove donor records
  
  ## Security Rationale
  
  - The donor registry is institutional data accessed by verified blood banks and hospitals
  - All policies require authentication to ensure only authorized personnel access the data
  - These policies allow full CRUD operations for authenticated users while blocking public access
  - This follows the principle that RLS must be restrictive by default
  
  ## Table Purpose
  
  The `redconnect pro` table stores donor information including:
  - Donor identification and contact details
  - Blood type and health status
  - Donation history and availability
  - Location data for proximity matching
  - Verification status for trust and compliance
*/

-- Add RLS policies for the "redconnect pro" table
-- All policies require authentication and allow institutional access

-- Allow authenticated users to view all donor records
CREATE POLICY "Authenticated users can view donor registry"
  ON "redconnect pro"
  FOR SELECT
  TO authenticated
  USING (true);

-- Allow authenticated users to insert new donor records
CREATE POLICY "Authenticated users can register donors"
  ON "redconnect pro"
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Allow authenticated users to update donor records
CREATE POLICY "Authenticated users can update donor data"
  ON "redconnect pro"
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Allow authenticated users to delete donor records
CREATE POLICY "Authenticated users can remove donors"
  ON "redconnect pro"
  FOR DELETE
  TO authenticated
  USING (true);
