USE [C20]
GO
/****** Object:  StoredProcedure [dbo].[MessageThreads_JoinSelectThreadInfoById]    Script Date: 9/20/2016 10:49:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[MessageThreads_JoinSelectThreadInfoById]

		@ThreadId int

as

/*

Declare @ThreadId int = 51;

Execute [dbo].[MessageThreads_JoinSelectThreadInfoById]
@ThreadId

*/

BEGIN

	SELECT

		m.Id as ThreadId
		,m.ThreadTitle
		,m.UserId
		,m.CreatedDate
		,m.LastMessageDate
		,m.CommentCount
		,m.ViewCount
			,u.profileName
			,u.profileLastName
			,u.userId
				,g.GroupId
				,g.ThreadId


	FROM MessageThreads AS m
		FULL join UserProfiles AS u
		ON u.userId = m.UserId
			FULL JOIN GroupThreads AS g
			ON m.Id = g.ThreadId

	WHERE m.Id = @ThreadId

	EXECUTE dbo.MessageThreads_UpdateThreadViewCount @ThreadId


END


