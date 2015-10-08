{function name="renderSocialMedia" url=null title=null media=null}

    {if $media}

        {$media = $media|lower}

        {if $media == "facebook"}
            {$href = "http://www.facebook.com/sharer.php?u={$url}"}
        {elseif $media == "google"}
            {$href = "https://plus.google.com/share?url={$url}"}
        {elseif $media == "pinterest"}
            {$href = "https://pinterest.com/pin/create/bookmarklet/?&url={$url}&description={$title}"}
        {elseif $media == "linkedin"}
            {$href = "http://www.linkedin.com/shareArticle?url={$url}&title={$title}"}
        {elseif $media == "digg"}
            {$href = "http://digg.com/submit?url={$url}&title={$title}"}
        {elseif $media == "reddit"}
            {$href = "http://reddit.com/submit?url={$url}&title={$title}"}
        {elseif $media == "stumbleupon"}
            {$href = "http://reddit.com/submit?url={$url}&title={$title}"}
        {elseif $media == "tumblr"}
            {$href = "http://www.tumblr.com/share/link?url={$url}&name={$title}"}
        {elseif $media == "twitter"}
            {$href = "https://twitter.com/share?url={$url}"}
        {elseif $media == "email"}
            {$href = "mailto:?Subject=&Body={$url}"}
        {/if}

        {if isset($href)}
            <a href="{$href}" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=450,width=600'); return false;" target="_blank" class="nav__link nav__link--{$media}" title="Share on {$media}">
                {if $media == "email"}
                    <i class="icon icon--envelope"></i>
                {else}
                    <i class="icon icon--{$media}"></i>
                {/if}
                <span class="visuallyhidden">{translate key="label.share.{$media}"}</span>
            </a>
        {/if}

    {/if}

{/function}
