unit UContratoArrozMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, Mask;

type
  TFContratoArrozMov = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    MeQtBaixar: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoArrozMov: TFContratoArrozMov;

implementation

uses UContratoArroz_cl, UOracle_cl;

{$R *.DFM}

procedure TFContratoArrozMov.BitBtn1Click(Sender: TObject);
begin
  With DMContratoArroz do
  Begin
    If StrToFloat(MeQtBaixar.Text) > QContrato_Nota_SaldoQt_Saldo.Value
    Then
       Raise Exception.Create ('Quantidade a Baixar Maior Quantidade da Nota');
    if (QContratoSaldoQt_Saldo.Value - StrToFloat(MeQtBaixar.Text) ) < 0
    Then
       Raise Exception.Create ('Quantidade a Baixar Maior Saldo Contrato');
    Try
      DMOracle.DBCemapa.StartTransaction;
      QContrato_Arroz.CommitOnPost := False;
      QContrato_Arroz.Close;
      QContrato_Arroz.SetVariable('PK',QContratoSaldoCod_Contrato_Arroz.Value);
      QContrato_Arroz.Open;
      QContrato_Arroz.Edit;
      QContrato_ArrozQt_Saldo.Value := QContrato_ArrozQt_Saldo.Value - StrToFloat(MeQtBaixar.Text);
      QContrato_Arroz.Post;
      QContrato_Arroz_Item.Open;
      QContrato_Arroz_Item.Insert;
      QContrato_Arroz_ItemCod_Nota_Item.Value := Trunc(QContrato_Nota_SaldoCod_Nota_Item.Value);
      QContrato_Arroz_ItemCod_Contrato_Arroz.Value := QContratoSaldoCod_Contrato_Arroz.Value;
      QContrato_Arroz_ItemQt_Quantidade.Value := StrToFloat(MeQtBaixar.Text);
      QContrato_Arroz_Item.Post;
      DMOracle.DBCemapa.Commit;
      QContrato_Arroz_Item.Close;
      DMContratoArroz.QContratoSaldo.Close;
      DMContratoArroz.QContrato_Nota_Saldo.Close;
      DMContratoArroz.QContratoSaldo.Open;
      DMContratoArroz.QContrato_Nota_Saldo.Open;
      QContrato_Arroz.CommitOnPost := True;
      MeQtBaixar.Text := '';
      MeQtBaixar.SetFocus;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
  end;
end;

procedure TFContratoArrozMov.BitBtn2Click(Sender: TObject);
begin
  With DMContratoArroz do
  Begin
    QContrato_Arroz_Item_Cons.Close;
    QContrato_Arroz_Item_Cons.Open;
  End;
end;

end.
