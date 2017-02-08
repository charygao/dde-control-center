#include "basiclistview.h"

#include <QDebug>

BasicListView::BasicListView(QWidget *parent)
    : QListView(parent)
{
//    setStyleSheet("background-color: red;");
    setFrameStyle(QFrame::NoFrame);
}

QSize BasicListView::sizeHint() const
{
    int height = 0;
    const int count = model()->rowCount();
    for (int i(0); i != count; ++i)
        height += sizeHintForRow(i);

    return QSize(QListView::sizeHint().width(), height);
}

void BasicListView::setModel(QAbstractItemModel *model)
{
    QListView::setModel(model);

    setMaximumHeight(sizeHint().height());
    connect(model, &QAbstractItemModel::layoutChanged, this, [=] { setMaximumHeight(sizeHint().height()); }, Qt::UniqueConnection);
}