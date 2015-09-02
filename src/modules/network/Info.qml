import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Deepin.Widgets 1.0
import "widgets"

Column {
    property int realHeight: childrenRect.height
    DBaseLine {
        leftLoader.sourceComponent: DssH1 {
            text: {
                if (getActiveConnectionInfo()) {
                    return dsTr("Connected")
                }
                return dsTr("Not Connected")
            }
        }
    }
    DSeparatorHorizontal{}

    function getActiveConnectionInfo() {
        var conns = []
        var json = dbusNetwork.GetActiveConnectionInfo()
        if (json) {
            conns = unmarshalJSON(json)
        }
        return conns
    }

    Repeater {
        model: getActiveConnectionInfo()
        DBaseExpand {
            width: root.width
            expanded: header.item.active
            header.sourceComponent: DDownArrowHeader {
                active: true
                text: {
                    if (modelData.IsPrimaryConnection) {
                        return modelData.ConnectionName + dsTr("(default)")
                    }
                    return modelData.ConnectionName
                }
            }
            content.sourceComponent: DBaseLine {
                height: leftLoader.item.height
                color: DPalette.contentBgColor
                leftLoader.sourceComponent: Column {
                    width: root.width
                    InfoItem {
                        label: dsTr("Interface");
                        value: {
                            if (modelData.ConnectionType == nmConnectionTypeMobileGsm || modelData.ConnectionType == nmConnectionTypeMobileCdma) {
                                return getConnectionDisplayName(modelData.ConnectionType) + " " + modelData.MobileNetworkType + " (" + modelData.DeviceInterface + ")"
                            } else {
                                return getConnectionDisplayName(modelData.ConnectionType) + " (" + modelData.DeviceInterface + ")"
                            }
                        }
                    }
                    InfoItem {label: dsTr("Security");       value: modelData.Security}
                    InfoItem {label: dsTr("Device Addr");    value: modelData.HwAddress}
                    InfoItem {label: dsTr("IP Address");     value: modelData.Ip4.Address}
                    InfoItem {label: dsTr("Subnet Mask");    value: modelData.Ip4.Mask}
                    InfoItem {label: dsTr("Gateway");        value: modelData.Ip4.Gateways.length > 0 ? modelData.Ip4.Gateways[0] : ""}
                    InfoItem {label: dsTr("Primary DNS");    value: modelData.Ip4.Dnses.length > 0 ? modelData.Ip4.Dnses[0] : ""}
                    InfoItem {label: dsTr("Secondary DNS");  value: modelData.Ip4.Dnses.length > 1 ? modelData.Ip4.Dnses[1] : ""}
                    InfoItem {label: dsTr("Third DNS");      value: modelData.Ip4.Dnses.length > 2 ? modelData.Ip4.Dnses[2] : ""}

                    // TODO: fill ipv6 informations
                    // InfoItem {label: dsTr("IPv6 Address");     value: modelData.Ip6.Address}
                    // InfoItem {label: dsTr("IPv6 Gateway");     value: modelData.Ip6.Gateways.length > 0 ? modelData.Ip6.Gateways[0] : ""} // TODO
                    // InfoItem {label: dsTr("IPv6 Primary DNS");    value: modelData.Ip6.Dnses.length > 0 ? modelData.Ip6.Dnses[0] : ""}
                    // InfoItem {label: dsTr("IPv6 Secondary DNS");  value: modelData.Ip6.Dnses.length > 1 ? modelData.Ip6.Dnses[1] : ""}
                    // InfoItem {label: dsTr("IPv6 Third DNS");      value: modelData.Ip6.Dnses.length > 2 ? modelData.Ip6.Dnses[2] : ""}

                    InfoItem {label: dsTr("Device Speed");   value: modelData.Speed}
                }
            }
        }
    }

    DSeparatorHorizontal {}

    DBaseLine{
        rightLoader.sourceComponent: DTextButton{
            text: dsTr("Cancel")
            onClicked: {
                stackView.reset()
            }
        }
    }
}