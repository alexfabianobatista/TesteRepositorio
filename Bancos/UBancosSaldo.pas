unit UBancosSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Mask, Grids, DBGrids, variants;

type
  TFBancosSaldo = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DSSaldoBanco: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    MEDtSaldo: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LSaldo: TLabel;
    LSaldoConcilia: TLabel;
    LSaldoLiquido: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancosSaldo: TFBancosSaldo;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFBancosSaldo.BitBtn1Click(Sender: TObject);
var wSaldo,wSaldoConcilia,wSaldoLiquido : Real;
begin
  with DMBancoAgenciaRel do
    begin
      QRBancoMov_SaldosBanco.Close;

      if Trim(MEDtSaldo.Text) <> '' then
        QRBancoMov_SaldosBanco.SetVariable('DATA_SALDO',StrToDate(MEDtSaldo.Text))
      else
        QRBancoMov_SaldosBanco.SetVariable('DATA_SALDO',Null);
      QRBancoMov_SaldosBanco.SetVariable('IND_BAIXA_CHEQUE','Ind_Baixa_Cheque='+QuoteDStr('N'));
      QRBancoMov_SaldosBanco.Open;

      with QRBancoMov_SaldosBanco do
        begin
          DisableControls;
          wSaldo:=0;
          wSaldoConcilia:=0;
          wSaldoLiquido:=0;
        try
          First;
          while not EOF do
            begin
              wSaldoConcilia:=wSaldoConcilia+QRBancoMov_SaldosBancoSaldo_Conciliacao.Value;
              wSaldoLiquido:=wSaldoLiquido+QRBancoMov_SaldosBancoSaldo_Liquido.Value;
              wSaldo:=wSaldo+QRBancoMov_SaldosBancoSaldo.Value;
              Next;
            end;
        finally
          EnableControls;
        end;
      end;
    end;
    LSaldo.Caption:=FormatFloat('#,##0.00',wSaldo);
    LSaldoConcilia.Caption:=FormatFloat('#,##0.00',wSaldoConcilia);
    LSaldoLiquido.Caption:=FormatFloat('#,##0.00',wSaldoLiquido);
end;

procedure TFBancosSaldo.FormActivate(Sender: TObject);
begin
  DMBancoAgenciaRel.QRBancoMov_SaldosBanco.Close;
  MeDtSaldo.Text := DateToStr(Date);
end;

procedure TFBancosSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DMBancoAgenciaRel do
    QRBancoMov_SaldosBanco.Close;
  Action := caFree;
  FBancosSaldo := Nil;
end;

end.
