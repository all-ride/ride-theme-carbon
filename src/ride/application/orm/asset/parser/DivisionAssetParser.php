<?php

namespace ride\application\orm\asset\parser;

use ride\application\orm\asset\entry\AssetEntry;

use ride\service\AssetService;
/**
 * Implementation to link an asset to the original resource
 */
class DivisionAssetParser extends GenericAssetParser {

    /**
     * Style class for the division tag
     * @var string
     */
    protected $divisionClass;

    /**
     * Sets the style class for the division tag
     * @param string $divisionClass Style class for the division tag
     * @return null
     */
    public function setDivisionClass($divisionClass) {
        $this->divisionClass = $divisionClass;
    }

    /**
     * Gets the HTML for the provided asset
     * @param \ride\service\AssetService $assetService
     * @param \ride\application\orm\asset\entry\AssetEntry $asset
     * @param string $style Name of the style
     * @return string HTML for the provided asset
     */
    public function getAssetHtml(AssetService $assetService, AssetEntry $asset, $style = null) {
        if (!$asset->isImage()) {
            return parent::getAssetHtml($assetService, $asset, $style);
        }

        $division = '<div';
        if ($this->divisionClass) {
            $division .= ' class="' . $this->divisionClass . '"';
        }
        $division .= '>';
        $division .= parent::getAssetHtml($assetService, $asset, $style);
        $division .= '</div>';

        return $division;
    }

}
