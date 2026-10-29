unit UOficinaConfirma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, Buttons;

type
  TFOficinaConfirma = class(TForm)
    PageControl1: TPageControl;
    TSContasReceber: TTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    LBContaReceber: TListBox;
    BtApagaParcela: TBitBtn;
    MEDiasCR: TMaskEdit;
    MEDataCR: TMaskEdit;
    MEValorCR: TMaskEdit;
    Label8: TLabel;
    Label6: TLabel;
    Label31: TLabel;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    LTotal: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MEDiasCRExit(Sender: TObject);
    procedure MEValorCRExit(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wTotalOS: Real;
  end;

var
  FOficinaConfirma: TFOficinaConfirma;

implementation

uses UDepartamento_cl, UDepartamentoCons, UFinalidade_cl, UFinalidadeCons,
  UOracle_cl, UBiblioteca;

{$R *.dfm}

procedure TFOficinaConfirma.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

procedure TFOficinaConfirma.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;
end;

procedure TFOficinaConfirma.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
  Begin
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text);
    if (DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)) <> 'SIM' Then
    Begin
      MeFinalidade.SetFocus;
      Raise Exception.Create ('Finalidade Nao Liberada Para Uso');
    End
  End
  Else
    EdFinalidade.Text := '';
end;

procedure TFOficinaConfirma.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;
end;

procedure TFOficinaConfirma.BitBtn1Click(Sender: TObject);
var
  wTotalParcelas: Real;
  wX: Integer;
  wAux: String;
begin
  if MEDepartamento.Text = '' then
    Raise Exception.Create('Por favor, informe o departamento.');
  if MEFinalidade.Text = '' then
    Raise Exception.Create('Por favor, informe a finalidade.');
  wTotalParcelas := 0;
  for wX := 0 to LBContaReceber.Items.Count - 1 do
  begin
    wAux := Copy(LBContaReceber.Items[wX],11,15);
    wAux := Bib.LimpaString(wAux,'.');
    wTotalParcelas := wTotalParcelas + StrToFloat(Trim(wAux));
  end;
  if Abs(wTotalParcelas - wTotalOS) > 0.01 then
    raise exception.Create('Total das parcelas não confere com total da Ordem de Serviço.');
  ModalResult := MrOk;
end;

procedure TFOficinaConfirma.FormShow(Sender: TObject);
begin
  LTotal.Caption := 'Total da Ordem de Serviço: ' + FormatFloat('#,##0.00', wTotalOS);
  MEDepartamento.Text := '1';
  EdDepartamento.Clear;
  MEFinalidade.Text := '2';
  EdFinalidade.Clear;
  LBContaReceber.Items.Clear;
  MEDiasCR.Clear;
  MEDataCR.Clear;
  MEValorCR.Clear;
end;

procedure TFOficinaConfirma.MEDiasCRExit(Sender: TObject);
begin
  if Trim(MEDiasCR.Text) <> '' then
  begin
    MEDataCR.Text := DateToStr(Date + StrToInt(Trim(MEDiasCR.Text)));
    MEDiasCR.Text := '';
  end;
end;

procedure TFOficinaConfirma.MEValorCRExit(Sender: TObject);
var wLinha, wAux : String;
const wBranco : String = '                            ';
begin
  if (MEDataCR.Text <> '') and (MEValorCR.Text <> '') then
  begin
    if StrToDate(MEDataCR.Text) < Date Then
       raise Exception.Create('Data de Vencimento Menor que Data Atual!');

    wLinha := DateToStr( StrToDate(Trim(MEDataCR.Text)) );
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValorCR.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);

    MEDataCR.Text := '';
    MEValorCR.Text := '';
    MEDiasCR.SetFocus;
  end;
end;

procedure TFOficinaConfirma.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

end.
