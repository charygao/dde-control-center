#include "updateview.h"

using namespace dcc;

UpdateView::UpdateView()
    : ModuleWidget()
{
    m_updateItem = new NextPageWidget;
    m_updateItem->setTitle(tr("Update"));
    m_updateGroup = new SettingsGroup;
    m_updateGroup->appendItem(m_updateItem);

    m_settingsItem = new NextPageWidget;
    m_settingsItem->setTitle(tr("Update Settings"));
    m_settingsGroup = new SettingsGroup;
    m_settingsGroup->appendItem(m_settingsItem);

    m_centeralLayout->addWidget(m_updateGroup);
    m_centeralLayout->addWidget(m_settingsGroup);

    setTitle(tr("Update"));

    connect(m_updateItem, &NextPageWidget::clicked, this, &UpdateView::showUpdateWidget);
    connect(m_settingsItem, &NextPageWidget::clicked, this, &UpdateView::showSettingsWidget);
}