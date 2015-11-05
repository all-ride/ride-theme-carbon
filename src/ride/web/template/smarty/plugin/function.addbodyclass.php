<?php

function smarty_function_addBodyClass($params, &$smarty) {
    $app = $smarty->getTemplateVars('app');
    $bodyComponent = $app['cms']['node']->get('body.class');
    if (!strstr($bodyComponent, $params['class'])) {
        $app['cms']['node']->set('body.class', $bodyComponent . ' ' . $params['class']);
    }
}
