// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

#include "tablemodel.h"

TableModel::TableModel(QObject *parent) : QAbstractTableModel(parent)
{
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
  table.append({ "John", "Doe", "32", "Farmer", "Single", "Gounduana", "Mestkv" });
  table.append({ "Mary", "Jane", "27", "Teacher", "Married", "Verkso", "Tukk" });
}

int TableModel::rowCount(const QModelIndex &) const
{
  return table.size();// Number of rows
}

int TableModel::columnCount(const QModelIndex &) const
{
  return table.at(0).size();// Columns
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
  switch (role) {
  case TableDataRole:
    return table.at(index.row()).at(index.column());
  default:
    break;
  }
  return QVariant();
}

QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
  if (role != Qt::DisplayRole) { return QVariant(); }
  if (orientation == Qt::Horizontal) {
    switch (section) {
    case 0:
      return "Name";
    case 1:
      return "Name";
    case 2:
      return "Age";
    case 3:
      return "Job";
    case 4:
      return "Status";
    case 5:
      return "Country";
    case 6:
      return "City";
    default:
      break;
    }
  } else if (orientation == Qt::Vertical) {
    return QVariant::fromValue(section + 1);
  }
  return QVariant();
}

QHash<int, QByteArray> TableModel::roleNames() const
{
  return {
    { TableDataRole, "tabledata" },
  };
}

QVariant TableModel::get_display_data(const QModelIndex &index) { return data(index, TableDataRole); }
