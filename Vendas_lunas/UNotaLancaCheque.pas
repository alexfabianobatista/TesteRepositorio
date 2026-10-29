unit UNotaLancaCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFNotaLancaCheque = class(TForm)
    Label1: TLabel;
    MeContaCorrente: TMaskEdit;
    Label2: TLabel;
    MeDepartamento: TMaskEdit;
    MeHistorico: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MeNrCheque: TMaskEdit;
    Label5: TLabel;
    MeValorCheque: TMaskEdit;
    MeDtCheque: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    MeObservacao: TMaskEdit;
    MeObservacao1: TMaskEdit;
    LbCheques: TListBox;
    BtConsBanco: TBitBtn;
    BtConsDepartamento: TBitBtn;
    BtConsHistorico: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtConsBancoClick(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BtConsHistoricoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaLancaCheque: TFNotaLancaCheque;

implementation

uses UContaCorrenteCons, UDepartamentoCons, UHistoricoCons;

{$R *.DFM}

procedure TFNotaLancaCheque.BtConsBancoClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
    MeContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;

end;

procedure TFNotaLancaCheque.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
end;

procedure TFNotaLancaCheque.BtConsHistoricoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  If FHistoricoCons.showModal = mrOk then
    MEHistorico.Text := DMHistorico.QHistoricoConsCod_Historico.Text;

end;

procedure TFNotaLancaCheque.BitBtn1Click(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If StrToDate(MEDataCp.Text) < Date Then
     Raise Exception.Create('Data de Vencimento Menor que Data Atual!');
  wLinha := FormatMaskText('CCCCCC',Trim(MeContaCorrente.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeDepartamento.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeHistorico.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeNrCheque.Text)) + ' - ';
  wAux := FormatFloat('###,###,##0.00',StrToFloat(MeValorCheque.Text)) + ' - ';
  wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
  wLinha := wLinha + wAux;
  wLinha := wLinha + DateToStr( StrToDate(MeDtCheque.Text) )
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',MeObservacao.Text);
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',MeObservacao1.Text);
  LbCheques.Items.Add(wLinha);
end;

procedure TFNotaLancaCheque.BitBtn2Click(Sender: TObject);
begin
  LBCheques.Items.Delete(LBCheques.ItemIndex);
end;

end.
