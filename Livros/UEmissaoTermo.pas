unit UEmissaoTermo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFEmissaoTermo = class(TForm)
    BtApuracaoIcms: TBitBtn;
    BtEntrada: TBitBtn;
    BtSaida: TBitBtn;
    procedure BtApuracaoIcmsClick(Sender: TObject);
    procedure BtEntradaClick(Sender: TObject);
    procedure BtSaidaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure EmiteTermo(Termo: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmissaoTermo: TFEmissaoTermo;

implementation

uses UEmissaoTermo_cl, UEmissaoTermoParam, URTermo, UBiblioteca;

{$R *.dfm}

procedure TFEmissaoTermo.EmiteTermo(Termo: String);
var
  dia: TDate;
begin
  if FEmissaoTermoParam = nil then
    FEmissaoTermoParam := TFEmissaoTermoParam.Create(Application);
  FEmissaoTermoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FEmissaoTermoParam.ShowModal = MrOk then
    with DMEmissaoTermo do
    begin
      QREmissaoTermo.Close;
      QREmissaoTermo.SetVariable('FILIAL', FEmissaoTermoParam.Fm1Filial.MeFilial.Text);
      QREmissaoTermo.SetVariable('DT_ABERTURA', StrToDate(FEmissaoTermoParam.ME1DataAbertura.Text));
      QREmissaoTermo.SetVariable('DT_FECHAMENTO', StrToDate(FEmissaoTermoParam.ME1DataFechamento.Text));
      QREmissaoTermo.SetVariable('PAGINA_I', FEmissaoTermoParam.ME1PagInicial.Text);
      QREmissaoTermo.SetVariable('PAGINA_F', FEmissaoTermoParam.ME1PagFinal.Text);
      QREmissaoTermo.SetVariable('NUM_ORDEM', FEmissaoTermoParam.ME1Numero.Text);
      case FEmissaoTermoParam.RG1Termo.ItemIndex of
        0: QREmissaoTermo.SetVariable('TIPO', 'ABERTURA');
        1: QREmissaoTermo.SetVariable('TIPO', 'ENCERRAMENTO');
        2: QREmissaoTermo.SetVariable('TIPO', null);
      end;
      QREmissaoTermo.SetVariable('DT_ABERTURA_TERMO',StrToDate(FEmissaoTermoParam.MEDtInicioTermo.Text));
      QREmissaoTermo.SetVariable('DT_ENCERRAMENTO_TERMO',StrToDate(FEmissaoTermoParam.MEDtFinalTermo.Text));
      QREmissaoTermo.SetVariable('TERMO', Termo);
      QREmissaoTermo.Open;

      if FRTermo = nil then
        FRTermo := TFRTermo.Create(Application);
      FRTermo.QRLOrgao.Caption := FEmissaoTermoParam.ME1Orgao.Text;
      dia := StrToDate(FEmissaoTermoParam.MEDtOrgao.Text);
      FRTermo.QRLNumInscricao.Caption := FEmissaoTermoParam.ME1NumInscricao.Text +
          ', em ' + FormatDateTime('dd', dia) + ' de ' + Bib.NomeMes(StrToInt(FormatDateTime('MM', dia))) +
          ' de ' + FormatDateTime('yyyy', dia);

      if FEmissaoTermoParam.RGPreview.ItemIndex = 0 then
        FRTermo.QRPrimario.Preview
      else
        FRTermo.QRPrimario.Print;

      QREmissaoTermo.Close;
    end;
end;

procedure TFEmissaoTermo.BtApuracaoIcmsClick(Sender: TObject);
begin
  EmiteTermo('APURACAO_ICMS');
end;

procedure TFEmissaoTermo.BtEntradaClick(Sender: TObject);
begin
  EmiteTermo('ENTRADA');
end;

procedure TFEmissaoTermo.BtSaidaClick(Sender: TObject);
begin
  EmiteTermo('SAIDA');
end;

procedure TFEmissaoTermo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
