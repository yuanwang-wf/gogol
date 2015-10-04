{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.AndroidEnterprise.Installs.Patch
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Requests to install the latest version of an app to a device. If the app
-- is already installed then it is updated to the latest version if
-- necessary. This method supports patch semantics.
--
-- /See:/ <https://developers.google.com/play/enterprise Google Play EMM API Reference> for @AndroidEnterpriseInstallsPatch@.
module Network.Google.Resource.AndroidEnterprise.Installs.Patch
    (
    -- * REST Resource
      InstallsPatchResource

    -- * Creating a Request
    , installsPatch'
    , InstallsPatch'

    -- * Request Lenses
    , ipQuotaUser
    , ipPrettyPrint
    , ipEnterpriseId
    , ipUserIP
    , ipInstall
    , ipUserId
    , ipInstallId
    , ipKey
    , ipDeviceId
    , ipOAuthToken
    , ipFields
    ) where

import           Network.Google.AndroidEnterprise.Types
import           Network.Google.Prelude

-- | A resource alias for @AndroidEnterpriseInstallsPatch@ which the
-- 'InstallsPatch'' request conforms to.
type InstallsPatchResource =
     "enterprises" :>
       Capture "enterpriseId" Text :>
         "users" :>
           Capture "userId" Text :>
             "devices" :>
               Capture "deviceId" Text :>
                 "installs" :>
                   Capture "installId" Text :>
                     QueryParam "quotaUser" Text :>
                       QueryParam "prettyPrint" Bool :>
                         QueryParam "userIp" Text :>
                           QueryParam "fields" Text :>
                             QueryParam "key" Key :>
                               QueryParam "oauth_token" OAuthToken :>
                                 QueryParam "alt" AltJSON :>
                                   ReqBody '[JSON] Install :>
                                     Patch '[JSON] Install

-- | Requests to install the latest version of an app to a device. If the app
-- is already installed then it is updated to the latest version if
-- necessary. This method supports patch semantics.
--
-- /See:/ 'installsPatch'' smart constructor.
data InstallsPatch' = InstallsPatch'
    { _ipQuotaUser    :: !(Maybe Text)
    , _ipPrettyPrint  :: !Bool
    , _ipEnterpriseId :: !Text
    , _ipUserIP       :: !(Maybe Text)
    , _ipInstall      :: !Install
    , _ipUserId       :: !Text
    , _ipInstallId    :: !Text
    , _ipKey          :: !(Maybe Key)
    , _ipDeviceId     :: !Text
    , _ipOAuthToken   :: !(Maybe OAuthToken)
    , _ipFields       :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'InstallsPatch'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ipQuotaUser'
--
-- * 'ipPrettyPrint'
--
-- * 'ipEnterpriseId'
--
-- * 'ipUserIP'
--
-- * 'ipInstall'
--
-- * 'ipUserId'
--
-- * 'ipInstallId'
--
-- * 'ipKey'
--
-- * 'ipDeviceId'
--
-- * 'ipOAuthToken'
--
-- * 'ipFields'
installsPatch'
    :: Text -- ^ 'enterpriseId'
    -> Install -- ^ 'Install'
    -> Text -- ^ 'userId'
    -> Text -- ^ 'installId'
    -> Text -- ^ 'deviceId'
    -> InstallsPatch'
installsPatch' pIpEnterpriseId_ pIpInstall_ pIpUserId_ pIpInstallId_ pIpDeviceId_ =
    InstallsPatch'
    { _ipQuotaUser = Nothing
    , _ipPrettyPrint = True
    , _ipEnterpriseId = pIpEnterpriseId_
    , _ipUserIP = Nothing
    , _ipInstall = pIpInstall_
    , _ipUserId = pIpUserId_
    , _ipInstallId = pIpInstallId_
    , _ipKey = Nothing
    , _ipDeviceId = pIpDeviceId_
    , _ipOAuthToken = Nothing
    , _ipFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
ipQuotaUser :: Lens' InstallsPatch' (Maybe Text)
ipQuotaUser
  = lens _ipQuotaUser (\ s a -> s{_ipQuotaUser = a})

-- | Returns response with indentations and line breaks.
ipPrettyPrint :: Lens' InstallsPatch' Bool
ipPrettyPrint
  = lens _ipPrettyPrint
      (\ s a -> s{_ipPrettyPrint = a})

-- | The ID of the enterprise.
ipEnterpriseId :: Lens' InstallsPatch' Text
ipEnterpriseId
  = lens _ipEnterpriseId
      (\ s a -> s{_ipEnterpriseId = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
ipUserIP :: Lens' InstallsPatch' (Maybe Text)
ipUserIP = lens _ipUserIP (\ s a -> s{_ipUserIP = a})

-- | Multipart request metadata.
ipInstall :: Lens' InstallsPatch' Install
ipInstall
  = lens _ipInstall (\ s a -> s{_ipInstall = a})

-- | The ID of the user.
ipUserId :: Lens' InstallsPatch' Text
ipUserId = lens _ipUserId (\ s a -> s{_ipUserId = a})

-- | The ID of the product represented by the install, e.g.
-- \"app:com.google.android.gm\".
ipInstallId :: Lens' InstallsPatch' Text
ipInstallId
  = lens _ipInstallId (\ s a -> s{_ipInstallId = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
ipKey :: Lens' InstallsPatch' (Maybe Key)
ipKey = lens _ipKey (\ s a -> s{_ipKey = a})

-- | The Android ID of the device.
ipDeviceId :: Lens' InstallsPatch' Text
ipDeviceId
  = lens _ipDeviceId (\ s a -> s{_ipDeviceId = a})

-- | OAuth 2.0 token for the current user.
ipOAuthToken :: Lens' InstallsPatch' (Maybe OAuthToken)
ipOAuthToken
  = lens _ipOAuthToken (\ s a -> s{_ipOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
ipFields :: Lens' InstallsPatch' (Maybe Text)
ipFields = lens _ipFields (\ s a -> s{_ipFields = a})

instance GoogleAuth InstallsPatch' where
        authKey = ipKey . _Just
        authToken = ipOAuthToken . _Just

instance GoogleRequest InstallsPatch' where
        type Rs InstallsPatch' = Install
        request
          = requestWithRoute defReq androidEnterpriseURL
        requestWithRoute r u InstallsPatch'{..}
          = go _ipEnterpriseId _ipUserId _ipDeviceId
              _ipInstallId
              _ipQuotaUser
              (Just _ipPrettyPrint)
              _ipUserIP
              _ipFields
              _ipKey
              _ipOAuthToken
              (Just AltJSON)
              _ipInstall
          where go
                  = clientWithRoute
                      (Proxy :: Proxy InstallsPatchResource)
                      r
                      u