unit UObraCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, variants, ActnList, ComObj, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFObraCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    BtCadastro: TSpeedButton;
    BtFilial: TSpeedButton;
    BtCidade: TSpeedButton;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    ObrasCadastradas1: TMenuItem;
    PosioFinanceiraObra1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Label11: TLabel;
    DBEdit14: TDBEdit;
    Label12: TLabel;
    DBEdit15: TDBEdit;
    Label13: TLabel;
    DBEdit16: TDBEdit;
    Label14: TLabel;
    DBEdit17: TDBEdit;
    Label15: TLabel;
    DBEdit18: TDBEdit;
    Label16: TLabel;
    DBEdit19: TDBEdit;
    BtCadastroEmpreiteiro: TSpeedButton;
    DBEdit20: TDBEdit;
    ContratoInicioObra1: TMenuItem;
    ContratoFinalObra1: TMenuItem;
    DeclaraoEmpreiteiro1: TMenuItem;
    ContratoEmpreiteiro1: TMenuItem;
    Label17: TLabel;
    DBEdit21: TDBEdit;
    Label18: TLabel;
    DBEdit22: TDBEdit;
    Label19: TLabel;
    DBEdit23: TDBEdit;
    Label20: TLabel;
    DBEdit24: TDBEdit;
    procedure BtCadastroClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtCidadeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ObrasCadastradas1Click(Sender: TObject);
    procedure PosioFinanceiraObra1Click(Sender: TObject);
    procedure BtCadastroEmpreiteiroClick(Sender: TObject);
    procedure ContratoInicioObra1Click(Sender: TObject);
    procedure ContratoFinalObra1Click(Sender: TObject);
    procedure DeclaraoEmpreiteiro1Click(Sender: TObject);
    procedure ContratoEmpreiteiro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObraCad: TFObraCad;
  WinWord, Docs, Doc: Variant;

implementation

uses UObra_cl, UFilialCons, UCidadeCons, UCadastroCons, UCadastro_cl,
  UFilial_cl, UCidade_cl, UObraCons, UObra_Param, UrObra, UObra_Rel_cl,
  URPosicaoFinanceiraObra, UBiblioteca;

{$R *.DFM}

procedure TFObraCad.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    DMObra.QObra_CadCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFObraCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk Then
    DMObra.QObra_CadCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFObraCad.BtCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons  = Nil then
     FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal=mrOk Then
    DMObra.QObra_CadCod_Cidade.Value:=DMCidade.QCidadeConsCod_Cidade.Value;
end;

procedure TFObraCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMObra.QObra_Cad.Open;
end;

procedure TFObraCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMObra.QObra_Cad.Close;
end;

procedure TFObraCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert,Dsedit] then
    Begin
      BtFilial.Enabled:=True;
      BtCadastro.Enabled:=True;
      BtCidade.Enabled:=True;
      BtCadastroEmpreiteiro.Enabled:=True;
    End
  Else
    Begin
      BtFilial.Enabled:=False;
      BtCadastro.Enabled:=False;
      BtCidade.Enabled:=False;
      BtCadastroEmpreiteiro.Enabled:=False;
    End;

end;

procedure TFObraCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FObraCons = Nil then
    FObraCons := TFObraCons.Create(Application);
  If FObraCons.ShowModal = mrOk then
  With DMObra do
  Begin
    QObra_Cad.Close;
    QObra_Cad.SetVariable('PK',QObra_ConsCod_Obra.Value);
    QObra_Cad.Open;
  End;
end;

procedure TFObraCad.ObrasCadastradas1Click(Sender: TObject);
begin
  inherited;
  if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[0].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMObra_Rel do
  begin
    QRObras.Close;
    if Trim(FObra_Param.Me0Cadastro.Text) = '' then
      QRObras.SetVariable('COD_CADASTRO',Null)
    else
      QRObras.SetVariable('COD_CADASTRO',StrToInt(Trim(FObra_Param.Me0Cadastro.Text)));
    if Trim(FObra_Param.ME0Filial.Text) = '' then
      QRObras.SetVariable('COD_FILIAL',Null)
    else
      QRObras.SetVariable('COD_FILIAL',StrToInt(Trim(FObra_Param.ME0Filial.Text)));
    if Trim(FObra_Param.Me0DtInicio.Text) <> '' then
      QRObras.SetVariable('DT_INICIO',StrToDate(FObra_Param.Me0DtInicio.Text))
    else
      QRObras.SetVariable('DT_INICIO',Null);
    if Trim(FObra_Param.Me0DtFim.Text) <> '' then
      QRObras.SetVariable('DT_FIM',StrToDate(FObra_Param.Me0DtFim.Text))
    else
      QRObras.SetVariable('DT_FIM',Null);
    Case FObra_Param.Rg0Situacao.ItemIndex of
      0 : QRObras.SetVariable('Ind_Situacao','A');
      1 : QRObras.SetVariable('Ind_Situacao','F');
      2 : QRObras.SetVariable('Ind_Situacao','C');
      3 : QRObras.SetVariable('Ind_Situacao',Null);
    End;
    QRObras.Open;
    if FRObra = Nil then
      FRObra := TFRObra.Create(Application);
    FRObra.QrlTitulo.Caption := 'Relatório de Eventos Cadastrados de '+FObra_Param.Me0DtInicio.Text + ' Até ' + FObra_Param.Me0Dtfim.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRObra.QRPrimario.Preview
    else
      FRObra.QRPrimario.Print;
    QRObras.Close;
  end;
end;

procedure TFObraCad.PosioFinanceiraObra1Click(Sender: TObject);
begin
  inherited;
  if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[8].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMObra_Rel do
  begin
    QRPosicaoFinanceiraObra.Close;
    if Trim(FObra_Param.Me9Cadastro.Text) = '' then
      QRPosicaoFinanceiraObra.SetVariable('COD_CADASTRO',Null)
    else
      QRPosicaoFinanceiraObra.SetVariable('COD_CADASTRO',StrToInt(Trim(FObra_Param.Me9Cadastro.Text)));

    if Trim(FObra_Param.ME9Filial.Text) = '' then
      QRPosicaoFinanceiraObra.SetVariable('COD_FILIAL',Null)
    else
      QRPosicaoFinanceiraObra.SetVariable('COD_FILIAL',StrToInt(Trim(FObra_Param.ME9Filial.Text)));

    if Trim(FObra_Param.ME9Obra.Text) = '' then
      QRPosicaoFinanceiraObra.SetVariable('COD_OBRA',Null)
    else
      QRPosicaoFinanceiraObra.SetVariable('COD_OBRA',StrToInt(Trim(FObra_Param.ME9Obra.Text)));

    if Trim(FObra_Param.Me9DtInicial.Text) <> '' then
      QRPosicaoFinanceiraObra.SetVariable('DT_EMISSAO_INI',StrToDate(FObra_Param.Me9DtInicial.Text))
    else
      QRPosicaoFinanceiraObra.SetVariable('DT_EMISSAO_INI',Null);

    if Trim(FObra_Param.Me9DtFinal.Text) <> '' then
      QRPosicaoFinanceiraObra.SetVariable('DT_EMISSAO_FIM',StrToDate(FObra_Param.Me9DtFinal.Text))
    else
      QRPosicaoFinanceiraObra.SetVariable('DT_EMISSAO_INI',Null);
    QRPosicaoFinanceiraObra.Open;
    if FRPosicaoFinanceiraObra = Nil then
      FRPosicaoFinanceiraObra := TFRPosicaoFinanceiraObra.Create(Application);
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRPosicaoFinanceiraObra.QRPrimario.Preview
    else
      FRPosicaoFinanceiraObra.QRPrimario.Print;
    QRObras.Close;
  end;
end;

procedure TFObraCad.BtCadastroEmpreiteiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    DMObra.QObra_CadCod_Cadastro_Funcionario.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFObraCad.ContratoInicioObra1Click(Sender: TObject);
var Path, campo : String;
begin
  if DMObra.QObra_CadCOD_OBRA.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMObra.QObra_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMObra.QObra_CadCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'comunicacao_inicio_obra.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%funcao_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNome_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%nome_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Identidade_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%rg_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cpf_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cpf_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMObra.QObra_CadDT_INICIO_OBRA.Value);
      Doc.Content.Find.Execute(FindText := '%data',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'comunicacao_inicio_obra1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');

end;

procedure TFObraCad.ContratoFinalObra1Click(Sender: TObject);
var Path, campo : String;
begin
  if DMObra.QObra_CadCOD_OBRA.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMObra.QObra_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMObra.QObra_CadCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'declaracao_termino_obra.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%funcao_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNome_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%nome_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Identidade_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%rg_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cpf_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cpf_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(' dd "de" MMMM "de" yyyy',DMObra.QObra_CadDT_INICIO_OBRA.Value);
      Doc.Content.Find.Execute(FindText := '%data',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(' dd "de" MMMM "de" yyyy',DMObra.QObra_CadDT_FIM_OBRA.Value);
      Doc.Content.Find.Execute(FindText := '%dt_Final',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'declaracao_termino_obra1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');

end;

procedure TFObraCad.DeclaraoEmpreiteiro1Click(Sender: TObject);
var Path, campo : String;
begin
  if DMObra.QObra_CadCOD_OBRA.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMObra.QObra_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMObra.QObra_CadCOD_CADASTRO_FUNCIONARIO.Value);
      DMCadastro.QCadastro.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'comunicacao_inicio_empreiteiro.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%empreiteiro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_empreiteiro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_empreiteiro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(' dd "de" MMMM "de" yyyy',DMObra.QObra_CadDT_INICIO_OBRA.Value);
      Doc.Content.Find.Execute(FindText := '%dt_inicio',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'comunicacao_inicio_empreiteiro1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');


end;

procedure TFObraCad.ContratoEmpreiteiro1Click(Sender: TObject);
var Path, campo : String;
   wTotal : Real;
begin
  if DMObra.QObra_CadCOD_OBRA.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMObra.QObra_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMObra.QObra_CadCOD_CADASTRO_FUNCIONARIO.Value);
      DMCadastro.QCadastro.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'contrato_prestacao_serviço.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadNUM_AREA_OBRA.Text;
      Doc.Content.Find.Execute(FindText := '%area',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMObra.QObra_CadNUM_AREA_OBRA.Value, 'METROS');
      Doc.Content.Find.Execute(FindText := '%extenso_area',ReplaceWith := campo,Replace:=2);
      campo := DMObra.QObra_CadDESC_NUMERO_LOTE.Value;
      Doc.Content.Find.Execute(FindText := '%Num_Lote',ReplaceWith := campo,Replace:=2);
      campo := DMObra.QObra_CadDESC_NUMERO_QUADRA.Value;
      Doc.Content.Find.Execute(FindText := '%Num_Quadra',ReplaceWith := campo,Replace:=2);
      campo := DMObra.QObra_CadDesc_Loteamento.Value;
      Doc.Content.Find.Execute(FindText := '%loteamento',ReplaceWith := campo,Replace:=2);
      campo := DMObra.QObra_CadDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bai_lote',ReplaceWith := campo,Replace:=2);
      campo:=DMObra.QObra_CadNUM_AREA_TERRENO.Text;
      Doc.Content.Find.Execute(FindText := '%lote_area',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMObra.QObra_CadNUM_AREA_TERRENO.Value, 'METROS');
      Doc.Content.Find.Execute(FindText := '%extenso_lote',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMObra.QObra_CadVAL_M2.Value);
      Doc.Content.Find.Execute(FindText := '%valor',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(DMObra.QObra_CadVAL_M2.Value,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso_valor',ReplaceWith := campo,Replace:=2);
      wTotal := DMObra.QObra_CadVAL_M2.Value * DMObra.QObra_CadNUM_AREA_OBRA.Value;
      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%total',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(wTotal,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso_total',ReplaceWith := campo,Replace:=2);


      campo:=FormatDateTime(' dd "de" MMMM "de" yyyy',DMObra.QObra_CadDT_INICIO_OBRA.Value);
      Doc.Content.Find.Execute(FindText := '%dt_inicio',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'comunicacao_inicio_empreiteiro1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');


end;

end.
