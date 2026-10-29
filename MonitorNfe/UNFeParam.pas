unit UNFeParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, UFmFilial,
  Mask, UFmEstado, UFmNfeLote, CustomDialog, NFe, CTe, CTeOS, Rps, DeclaracaoPrestacaoServico, MDFe, ActnList,
  UFmCidade, UFmCadastro, NFSeNacional;

type
  TFNFeParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm0Filial: TFmFilial;
    Label1: TLabel;
    ME0Serie: TMaskEdit;
    Label2: TLabel;
    ME0NumInicial: TMaskEdit;
    Label3: TLabel;
    ME0NumFinal: TMaskEdit;
    Fm0Estado: TFmEstado;
    Label4: TLabel;
    ME0Justificativa: TMaskEdit;
    TabSheet2: TTabSheet;
    ME1Email: TMaskEdit;
    Label6: TLabel;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    ME2NumVias: TMaskEdit;
    Label7: TLabel;
    ME2Impressora: TMaskEdit;
    Label8: TLabel;
    GP1TipoArquivo: TGroupBox;
    CB1TipoXml: TCheckBox;
    CB1TipoPdf: TCheckBox;
    TabSheet4: TTabSheet;
    Label9: TLabel;
    ME3Chave: TMaskEdit;
    SB3ChaveAcesso: TSpeedButton;
    PC3EmissaoNFe: TPageControl;
    TSNFe: TTabSheet;
    TSLote: TTabSheet;
    RG3EmissaoNfe: TRadioGroup;
    RG3Ambiente: TRadioGroup;
    RG3Contingencia: TRadioGroup;
    CB3Danfe: TCheckBox;
    CB3Email: TCheckBox;
    CB3EmailXML: TCheckBox;
    CB3EmailPDF: TCheckBox;
    SB2Impressora: TSpeedButton;
    PDDanfe: TPrintDialog;
    TabSheet6: TTabSheet;
    Label10: TLabel;
    ME5Chave: TMaskEdit;
    RG5Ambiente: TRadioGroup;
    CB5Danfe: TCheckBox;
    CB5Email: TCheckBox;
    CB5EmailXML: TCheckBox;
    CB5EmailPDF: TCheckBox;
    PC5EmissaoNFSe: TPageControl;
    TSNFSe: TTabSheet;
    TSLote2: TTabSheet;
    RG5EmissaoNfse: TRadioGroup;
    SB5ChaveAcesso: TSpeedButton;
    TabSheet7: TTabSheet;
    CB6Impressao: TCheckBox;
    CB6Email: TCheckBox;
    CB6EmailXml: TCheckBox;
    CB6EmailPdf: TCheckBox;
    Label11: TLabel;
    ME6Chave: TMaskEdit;
    RG6Ambiente: TRadioGroup;
    TabSheet8: TTabSheet;
    Label12: TLabel;
    SB7ChaveAcesso: TSpeedButton;
    ME7Chave: TMaskEdit;
    PC7EmissaoCTe: TPageControl;
    TSCTe: TTabSheet;
    TSLoteCTe: TTabSheet;
    RG7EmissaoCTe: TRadioGroup;
    RG7Ambiente: TRadioGroup;
    RG7Contingencia: TRadioGroup;
    CB7Dacte: TCheckBox;
    CB7Email: TCheckBox;
    CB7EmailXML: TCheckBox;
    CB7EmailPDF: TCheckBox;
    TabSheet9: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Fm8Filial: TFmFilial;
    Me8Serie: TMaskEdit;
    Me8NumInicial: TMaskEdit;
    Me8NumFinal: TMaskEdit;
    Fm8Estado: TFmEstado;
    Me8Justificativa: TMaskEdit;
    StatusBar1: TStatusBar;
    TabSheet10: TTabSheet;
    Label17: TLabel;
    SB9ChaveAcesso: TSpeedButton;
    ME9Chave: TMaskEdit;
    PC9EmissaoMDFe: TPageControl;
    TSMDFe: TTabSheet;
    TSLoteMDFe: TTabSheet;
    RG9EmissaoMDFe: TRadioGroup;
    RG9Ambiente: TRadioGroup;
    CB9Damdfe: TCheckBox;
    CB9Email: TCheckBox;
    CB9EmailXML: TCheckBox;
    CB9EmailPDF: TCheckBox;
    TabSheet11: TTabSheet;
    Fm10Estado: TFmEstado;
    Fm10Cidade: TFmCidade;
    MeDataEncMDFe: TMaskEdit;
    Label18: TLabel;
    TabSheet12: TTabSheet;
    Fm11Cadastro: TFmCadastro;
    TabSheet13: TTabSheet;
    Label19: TLabel;
    SB4ChaveAcesso: TSpeedButton;
    ME4Chave: TMaskEdit;
    PC4EmissaoNFe: TPageControl;
    TSNFCe: TTabSheet;
    TSLoteNFCe: TTabSheet;
    RG4EmissaoNfce: TRadioGroup;
    RG4Ambiente: TRadioGroup;
    RG4Contingencia: TRadioGroup;
    CB4Danfe: TCheckBox;
    CB4Email: TCheckBox;
    CB4EmailXML: TCheckBox;
    CB4EmailPDF: TCheckBox;
    CB0Modelo: TComboBox;
    Label20: TLabel;
    TabSheet5: TTabSheet;
    Fm12Filial: TFmFilial;
    Label21: TLabel;
    CB8Modelo: TComboBox;
    TabSheet14: TTabSheet;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    SB13Impressora: TSpeedButton;
    ME13NumVias: TMaskEdit;
    ME13Impressora: TMaskEdit;
    TabSheet15: TTabSheet;
    Label26: TLabel;
    SB14Impressora: TSpeedButton;
    ME14Impressora: TMaskEdit;
    Label27: TLabel;
    CB3PrevisualizacaoDanfe: TCheckBox;
    CB9PrevisualizacaoDamdfe: TCheckBox;
    CB7PrevisualizacaoDacte: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SB3ChaveAcessoClick(Sender: TObject);
    procedure CB4EmailClick(Sender: TObject);
    procedure CB3EmailClick(Sender: TObject);
    procedure SB2ImpressoraClick(Sender: TObject);
    procedure CB6EmailClick(Sender: TObject);
    procedure CB5EmailClick(Sender: TObject);
    procedure CB7EmailClick(Sender: TObject);
    procedure CB9EmailClick(Sender: TObject);
    procedure SB13ImpressoraClick(Sender: TObject);
    procedure SB14ImpressoraClick(Sender: TObject);

  private
    FNFe: TNFe;
    FCTe: TCTe;
    FCTeOS: TCTeOS;
    FRps: TRps;
    FMDFe: TMDFe;
    FDeclaracaoPrestacaoServico: TDeclaracaoPrestacaoServico;
    FDPS: TCDPS;

  public
    property NFe: TNFe read FNFe write FNFe;
    property CTe: TCTe read FCTe write FCTe;
    property CTeOS: TCTeOS read FCTeOS write FCTeOS;
    property Rps: TRps read FRps write FRps;
    property MDFe: TMDFe read FMDFe write FMDFe;
    property DeclaracaoPrestacaoServico: TDeclaracaoPrestacaoServico read FDeclaracaoPrestacaoServico write FDeclaracaoPrestacaoServico;
    property DPS: TCDPS read FDPS write FDPS;
  end;

var
  FNFeParam: TFNFeParam;
  MsgEdLote: String;

implementation

uses UUsuario_cl, UOracle_cl, UBiblioteca, NfeUtils, winspool, Printers, Math,
  UParamSistema_cl, UNfe_cl, UNotaSaida_cl;

{$R *.dfm}

procedure TFNFeParam.FormCreate(Sender: TObject);
begin
  inherited;
  Fm0Filial.MeFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  ME0Serie.Text := '1';
  ME0Justificativa.Text := 'NUMERACAO PULADA';
  Fm0Estado.MeEstado.Text := DMOracle.FastSelect('COD_ESTADO', 'TB_FILIAL',
      'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));

  Fm8Filial.MeFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  ME8Serie.Text := '1';
  ME8Justificativa.Text := 'NUMERACAO PULADA';
  Fm8Estado.MeEstado.Text := DMOracle.FastSelect('COD_ESTADO', 'TB_FILIAL',
      'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));

  Bib.addControleCharCase(ME1Email, Self.Name);
  Bib.addControleCharCase(ME3Chave, Self.Name);
 //MsgEdLote := Fm3NfeLote.EdDescricao.Text;
 if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
  StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';

 if (DMParamSistema.CodEmpresa = 'LUCILUCI') and (DMnotasaida.qnotasaidacod_serie_modelo.value = '55') then
   CB3PrevisualizacaoDanfe.Checked := true;
end;

procedure TFNFeParam.SB3ChaveAcessoClick(Sender: TObject);
var
  Chave: String;
begin
  inherited;
  case MessageDlgCustom('Alterar chave de acesso', mtConfirmation,
    [mbYes,mbNo,mbCancel], ['Informar manualmente',
    'Gerar outra chave automaticamente', 'Cancelar'], nil) of
    mrYes:
    begin
      Chave := ME3Chave.Text;
      if InputQuery('Nova Chave de Acesso', 'Digite a chave:', Chave) then
        ME3Chave.Text := 'NFe' + Bib.LimpaNumero(Chave);
    end;
    mrNo:
    begin
      if FNFe <> nil then
        if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          with FNFe.InfNfe do
            ME3Chave.Text := 'NFe' + TNfeUtils.GeraChaveAcesso(Ide.CUf, Ide.DEmi.Valor,
              Emit.CNPJ, StrToInt(Ide.Mod_), Ide.Serie, Ide.NNf, Ide.TpEmis);
    end;
  end;
end;

procedure TFNFeParam.CB4EmailClick(Sender: TObject);
begin
  inherited;
  CB4EmailXML.Enabled := CB4Email.Checked;
  CB4EmailPDF.Enabled := CB4Email.Checked;
end;

procedure TFNFeParam.CB3EmailClick(Sender: TObject);
begin
  inherited;
  CB3EmailXML.Enabled := CB3Email.Checked;
  CB3EmailPDF.Enabled := CB3Email.Checked;
end;

procedure TFNFeParam.SB2ImpressoraClick(Sender: TObject);    
begin
  ME2Impressora.Text := Bib.SelecionaImpressora(Self);
end;

procedure TFNFeParam.CB6EmailClick(Sender: TObject);
begin
  inherited;
  CB6EmailXML.Enabled := CB6Email.Checked;
  CB6EmailPDF.Enabled := CB6Email.Checked;
end;

procedure TFNFeParam.CB5EmailClick(Sender: TObject);
begin
  inherited;
  CB5EmailXML.Enabled := CB5Email.Checked;
  CB5EmailPDF.Enabled := CB5Email.Checked;
end;

procedure TFNFeParam.CB7EmailClick(Sender: TObject);
begin
  inherited;
  CB7EmailXML.Enabled := CB7Email.Checked;
  CB7EmailPDF.Enabled := CB7Email.Checked;
end;


procedure TFNFeParam.CB9EmailClick(Sender: TObject);
begin
  inherited;
  CB9EmailXML.Enabled := CB9Email.Checked;
  CB9EmailPDF.Enabled := CB9Email.Checked;
end;

procedure TFNFeParam.SB13ImpressoraClick(Sender: TObject);
begin
  ME13Impressora.Text := Bib.SelecionaImpressora(Self);
end;

procedure TFNFeParam.SB14ImpressoraClick(Sender: TObject);
begin
  ME14Impressora.Text := Bib.SelecionaImpressora(Self);
end;

end.

