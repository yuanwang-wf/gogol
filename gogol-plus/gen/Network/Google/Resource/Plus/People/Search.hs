{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Plus.People.Search
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Search all public profiles.
--
-- /See:/ <https://developers.google.com/+/api/ Google+ API Reference> for @PlusPeopleSearch@.
module Plus.People.Search
    (
    -- * REST Resource
      PeopleSearchAPI

    -- * Creating a Request
    , peopleSearch
    , PeopleSearch

    -- * Request Lenses
    , psQuotaUser
    , psPrettyPrint
    , psUserIp
    , psKey
    , psQuery
    , psLanguage
    , psPageToken
    , psOauthToken
    , psMaxResults
    , psFields
    , psAlt
    ) where

import           Network.Google.Plus.Types
import           Network.Google.Prelude

-- | A resource alias for @PlusPeopleSearch@ which the
-- 'PeopleSearch' request conforms to.
type PeopleSearchAPI =
     "people" :>
       QueryParam "query" Text :>
         QueryParam "language" Text :>
           QueryParam "pageToken" Text :>
             QueryParam "maxResults" Word32 :>
               Get '[JSON] PeopleFeed

-- | Search all public profiles.
--
-- /See:/ 'peopleSearch' smart constructor.
data PeopleSearch = PeopleSearch
    { _psQuotaUser   :: !(Maybe Text)
    , _psPrettyPrint :: !Bool
    , _psUserIp      :: !(Maybe Text)
    , _psKey         :: !(Maybe Text)
    , _psQuery       :: !Text
    , _psLanguage    :: !Text
    , _psPageToken   :: !(Maybe Text)
    , _psOauthToken  :: !(Maybe Text)
    , _psMaxResults  :: !Word32
    , _psFields      :: !(Maybe Text)
    , _psAlt         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PeopleSearch'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'psQuotaUser'
--
-- * 'psPrettyPrint'
--
-- * 'psUserIp'
--
-- * 'psKey'
--
-- * 'psQuery'
--
-- * 'psLanguage'
--
-- * 'psPageToken'
--
-- * 'psOauthToken'
--
-- * 'psMaxResults'
--
-- * 'psFields'
--
-- * 'psAlt'
peopleSearch
    :: Text -- ^ 'query'
    -> PeopleSearch
peopleSearch pPsQuery_ =
    PeopleSearch
    { _psQuotaUser = Nothing
    , _psPrettyPrint = True
    , _psUserIp = Nothing
    , _psKey = Nothing
    , _psQuery = pPsQuery_
    , _psLanguage = "en-US"
    , _psPageToken = Nothing
    , _psOauthToken = Nothing
    , _psMaxResults = 25
    , _psFields = Nothing
    , _psAlt = "json"
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
psQuotaUser :: Lens' PeopleSearch' (Maybe Text)
psQuotaUser
  = lens _psQuotaUser (\ s a -> s{_psQuotaUser = a})

-- | Returns response with indentations and line breaks.
psPrettyPrint :: Lens' PeopleSearch' Bool
psPrettyPrint
  = lens _psPrettyPrint
      (\ s a -> s{_psPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
psUserIp :: Lens' PeopleSearch' (Maybe Text)
psUserIp = lens _psUserIp (\ s a -> s{_psUserIp = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
psKey :: Lens' PeopleSearch' (Maybe Text)
psKey = lens _psKey (\ s a -> s{_psKey = a})

-- | Specify a query string for full text search of public text in all
-- profiles.
psQuery :: Lens' PeopleSearch' Text
psQuery = lens _psQuery (\ s a -> s{_psQuery = a})

-- | Specify the preferred language to search with. See search language codes
-- for available values.
psLanguage :: Lens' PeopleSearch' Text
psLanguage
  = lens _psLanguage (\ s a -> s{_psLanguage = a})

-- | The continuation token, which is used to page through large result sets.
-- To get the next page of results, set this parameter to the value of
-- \"nextPageToken\" from the previous response. This token can be of any
-- length.
psPageToken :: Lens' PeopleSearch' (Maybe Text)
psPageToken
  = lens _psPageToken (\ s a -> s{_psPageToken = a})

-- | OAuth 2.0 token for the current user.
psOauthToken :: Lens' PeopleSearch' (Maybe Text)
psOauthToken
  = lens _psOauthToken (\ s a -> s{_psOauthToken = a})

-- | The maximum number of people to include in the response, which is used
-- for paging. For any response, the actual number returned might be less
-- than the specified maxResults.
psMaxResults :: Lens' PeopleSearch' Word32
psMaxResults
  = lens _psMaxResults (\ s a -> s{_psMaxResults = a})

-- | Selector specifying which fields to include in a partial response.
psFields :: Lens' PeopleSearch' (Maybe Text)
psFields = lens _psFields (\ s a -> s{_psFields = a})

-- | Data format for the response.
psAlt :: Lens' PeopleSearch' Text
psAlt = lens _psAlt (\ s a -> s{_psAlt = a})

instance GoogleRequest PeopleSearch' where
        type Rs PeopleSearch' = PeopleFeed
        request = requestWithRoute defReq plusURL
        requestWithRoute r u PeopleSearch{..}
          = go _psQuotaUser _psPrettyPrint _psUserIp _psKey
              (Just _psQuery)
              (Just _psLanguage)
              _psPageToken
              _psOauthToken
              (Just _psMaxResults)
              _psFields
              _psAlt
          where go
                  = clientWithRoute (Proxy :: Proxy PeopleSearchAPI) r
                      u