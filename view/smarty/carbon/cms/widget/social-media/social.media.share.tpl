{$title = $app.cms.context.title.node|text}
{$url = $app.url.request}

{include file="cms/widget/social-media/services"}

{if isset($socialMedia)}
  <div class="block">
    <div class="inline inline--share">
      {foreach $socialMedia as $media}
        <div class="inline__item">
          {call renderSocialMedia url=$url title=$title media=$media}
        </div>
      {/foreach}
    </div>
  </div>
{/if}
