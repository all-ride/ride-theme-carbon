{* widget: template; action: index; translation: template.template.images.gallery *}

{include 'cms/helper/assets'}

{$data = $app.cms.context.content->data}

{if isset($data->media) && $data->getMedia()}
    {call renderAssets assets=$data->getMedia()}
{/if}
