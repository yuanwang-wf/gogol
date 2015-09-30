{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.AdSense.Accounts.Alerts.List
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | List the alerts for the specified AdSense account.
--
-- /See:/ <https://developers.google.com/adsense/management/ AdSense Management API Reference> for @AdsenseAccountsAlertsList@.
module AdSense.Accounts.Alerts.List
    (
    -- * REST Resource
      AccountsAlertsListAPI

    -- * Creating a Request
    , accountsAlertsList
    , AccountsAlertsList

    -- * Request Lenses
    , aQuotaUser
    , aPrettyPrint
    , aUserIp
    , aLocale
    , aAccountId
    , aKey
    , aOauthToken
    , aFields
    , aAlt
    ) where

import           Network.Google.AdSense.Types
import           Network.Google.Prelude

-- | A resource alias for @AdsenseAccountsAlertsList@ which the
-- 'AccountsAlertsList' request conforms to.
type AccountsAlertsListAPI =
     "accounts" :>
       Capture "accountId" Text :>
         "alerts" :>
           QueryParam "locale" Text :> Get '[JSON] Alerts

-- | List the alerts for the specified AdSense account.
--
-- /See:/ 'accountsAlertsList' smart constructor.
data AccountsAlertsList = AccountsAlertsList
    { _aQuotaUser   :: !(Maybe Text)
    , _aPrettyPrint :: !Bool
    , _aUserIp      :: !(Maybe Text)
    , _aLocale      :: !(Maybe Text)
    , _aAccountId   :: !Text
    , _aKey         :: !(Maybe Text)
    , _aOauthToken  :: !(Maybe Text)
    , _aFields      :: !(Maybe Text)
    , _aAlt         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'AccountsAlertsList'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'aQuotaUser'
--
-- * 'aPrettyPrint'
--
-- * 'aUserIp'
--
-- * 'aLocale'
--
-- * 'aAccountId'
--
-- * 'aKey'
--
-- * 'aOauthToken'
--
-- * 'aFields'
--
-- * 'aAlt'
accountsAlertsList
    :: Text -- ^ 'accountId'
    -> AccountsAlertsList
accountsAlertsList pAAccountId_ =
    AccountsAlertsList
    { _aQuotaUser = Nothing
    , _aPrettyPrint = True
    , _aUserIp = Nothing
    , _aLocale = Nothing
    , _aAccountId = pAAccountId_
    , _aKey = Nothing
    , _aOauthToken = Nothing
    , _aFields = Nothing
    , _aAlt = "json"
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
aQuotaUser :: Lens' AccountsAlertsList' (Maybe Text)
aQuotaUser
  = lens _aQuotaUser (\ s a -> s{_aQuotaUser = a})

-- | Returns response with indentations and line breaks.
aPrettyPrint :: Lens' AccountsAlertsList' Bool
aPrettyPrint
  = lens _aPrettyPrint (\ s a -> s{_aPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
aUserIp :: Lens' AccountsAlertsList' (Maybe Text)
aUserIp = lens _aUserIp (\ s a -> s{_aUserIp = a})

-- | The locale to use for translating alert messages. The account locale
-- will be used if this is not supplied. The AdSense default (English) will
-- be used if the supplied locale is invalid or unsupported.
aLocale :: Lens' AccountsAlertsList' (Maybe Text)
aLocale = lens _aLocale (\ s a -> s{_aLocale = a})

-- | Account for which to retrieve the alerts.
aAccountId :: Lens' AccountsAlertsList' Text
aAccountId
  = lens _aAccountId (\ s a -> s{_aAccountId = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
aKey :: Lens' AccountsAlertsList' (Maybe Text)
aKey = lens _aKey (\ s a -> s{_aKey = a})

-- | OAuth 2.0 token for the current user.
aOauthToken :: Lens' AccountsAlertsList' (Maybe Text)
aOauthToken
  = lens _aOauthToken (\ s a -> s{_aOauthToken = a})

-- | Selector specifying which fields to include in a partial response.
aFields :: Lens' AccountsAlertsList' (Maybe Text)
aFields = lens _aFields (\ s a -> s{_aFields = a})

-- | Data format for the response.
aAlt :: Lens' AccountsAlertsList' Text
aAlt = lens _aAlt (\ s a -> s{_aAlt = a})

instance GoogleRequest AccountsAlertsList' where
        type Rs AccountsAlertsList' = Alerts
        request = requestWithRoute defReq adSenseURL
        requestWithRoute r u AccountsAlertsList{..}
          = go _aQuotaUser _aPrettyPrint _aUserIp _aLocale
              _aAccountId
              _aKey
              _aOauthToken
              _aFields
              _aAlt
          where go
                  = clientWithRoute
                      (Proxy :: Proxy AccountsAlertsListAPI)
                      r
                      u