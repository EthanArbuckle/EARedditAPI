EARedditAPI
===========
<table>
 <tr><th colspan="2" style="text-align:center;">Usage</th></tr>
  <tr>
    <td>Upvote a comment or link</td>
    <td>[api upvoteThing:@"tx_xxxxx"];</td>
  </tr>
  <tr>
    <td>Unvote a comment or link</td>
    <td>[api unvoteThing:@"tx_xxxxx"];</td>
  </tr>
  <tr>
    <td>Downvote a comment or link</td>
    <td>[api downvoteThing:@"tx_xxxxx"];</td>
  </tr>
  <tr>
    <td>Hide a post</td>
    <td>[api hidePostWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Unhide a post</td>
    <td>[api unhidePostWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Save a post</td>
    <td>[api savePostWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Unsave a post</td>
    <td>[api unsavePostWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Add reply to a comment or link</td>
    <td>[api addReplyText:@"comment text" toThingID:@"tx_xxxxx"];</td>
  </tr>
  <tr>
    <td>Delete a comment</td>
    <td>[api deleteReplyWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Edit a comment</td>
    <td>[api editCommentWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Edit a text post</td>
    <td>[api editPostTextWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Delete a post</td>
    <td>[api deletePostWithID:@"xxxxx"];</td>
  </tr>
  <tr>
    <td>Report a post or comment</td>
    <td>[api reportThingWithThingID:tx_xxxxx"];</td>
  </tr>
  <tr>
    <td>Mark a post or comment as NSFW</td>
    <td>[api markNSFWWithThingID:@"tx_xxxxx"];</td>
  </tr>
  <tr>
    <td>Unmark a post or comment as NSFW</td>
    <td>[api unmarkNSFWWithThingID:@"tx_xxxxx"];</td>
  </tr>
    <tr>
    <td>Send a PM to a user</td>
    <td>[api sendPMTo:@"username" withSubject:@"Message Subject" andMessage:@"Message Body"];</td>
  </tr>
</table>
