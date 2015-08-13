{if $socialMedia}
  <div class="block">
    {if $title}
        <h2 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
    {/if}

    <div class="inline inline--share">
      {foreach from=$socialMedia item=media}
        <div class="inline__item">
          <a href="{$media['url']}" target="_blank"><i class="icon icon--{$media['name']}-square"></i></a>
        </div>
      {/foreach}
    </div>
  </div>
{/if}
