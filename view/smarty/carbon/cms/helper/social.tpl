{function name="renderSocialMedia" url=null title=null media=null}
    {if $media}
        {$label = $media|capitalize}
        {$media = $media|lower}
        {$url = $url|urlencode}

        {$links = [
            'facebook' => "http://www.facebook.com/sharer.php?u={$url}",
            'google' => "https://plus.google.com/share?url={$url}",
            'pinterest' => "https://pinterest.com/pin/create/bookmarklet/?&url={$url}&description={$title}",
            'linkedin' => "http://www.linkedin.com/shareArticle?url={$url}&title={$title}",
            'digg' => "http://digg.com/submit?url={$url}&title={$title}",
            'reddit' => "http://reddit.com/submit?url={$url}&title={$title}",
            'stumbleupon' => "http://reddit.com/submit?url={$url}&title={$title}",
            'tumblr' => "http://www.tumblr.com/share/link?url={$url}&name={$title}",
            'twitter' => "https://twitter.com/share?url={$url}",
            'email' => "mailto:?Subject=&Body={$url}"
        ]}

        {if isset($links.$media)}
            <a href="{$links.$media}" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=450,width=600'); return false;" target="_blank" class="nav__link nav__link--{$media}" title="Share on {$label}">
                {if $media == "email"}
                    <i class="icon icon--envelope"></i>
                {else}
                    <i class="icon icon--{$media}"></i>
                {/if}
                <span class="visuallyhidden">{$label}</span>
            </a>
        {/if}
    {/if}
{/function}
