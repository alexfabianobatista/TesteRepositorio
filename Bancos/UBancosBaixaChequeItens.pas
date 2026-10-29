unit UBancosBaixaChequeItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, ExtCtrls, OracleNavigator, Db, Grids, DBGrids, StdCtrls,
  Mask, Buttons, DBCtrls, Menus;

type
  TFBancosBaixaChequeItens = class(TFTConsulta)
    OracleNavigator1: TOracleNavigator;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DsBancoBaixaCheque: TDataSource;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancosBaixaChequeItens: TFBancosBaixaChequeItens;

implementation

uses UBancoAgencia_cl;

{$R *.DFM}

procedure TFBancosBaixaChequeItens.FormActivate(Sender: TObject);
begin
  inherited;
  DMBancoAgencia.QBcoMovimentoMov.close;
  DMBancoAgencia.QBcoMovimentoMov.open;
end;

end.
