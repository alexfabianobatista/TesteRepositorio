unit UDmSabor;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmSabor = class(TDataModule)
    QSelSabor: TIBQuery;
    DsSelSabor: TDataSource;
    QSelSaborCOD_SABOR: TIntegerField;
    QSelSaborDESC_SABOR: TIBStringField;
    QSelSaborVLR_INTEGRAL: TFloatField;
    QSelSaborCOD_TIPO_PRODUTO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmSabor: TDmSabor;

implementation

{$R *.dfm}

end.
