unit UAtestadoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFAtestadoCad = class(TFTCadSimples)
    Panel2: TPanel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BTLoteSementeCons: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    BTLaboratorioCons: TBitBtn;
    BTFuncionarioCons: TBitBtn;
    ImpressoAtestado1: TMenuItem;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTLoteSementeConsClick(Sender: TObject);
    procedure BTLaboratorioConsClick(Sender: TObject);
    procedure BTFuncionarioConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ImpressoAtestado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtestadoCad: TFAtestadoCad;

implementation

uses UAtestado_cl, UProducaoSemente_cl, ULoteSementeCons, UCadastroCons,
  UCadastro_cl, UFFuncionarioCons, UFuncionario_cl, UAtestadoCons,
  URAtestadoSemente, UBiblioteca, UOracle_cl, UMensagemCons, UMensagem_cl,
  UParamSistema_cl, URAtestadoMoinho;

{$R *.DFM}

procedure TFAtestadoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMAtestado do
  begin
    QAtestado.Open;
    QAtestadoItem.Open;
  end;
end;

procedure TFAtestadoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMAtestado do
  begin
    QAtestado.Close;
    QAtestadoItem.Close;
  end;
  action := caFree;
  FAtestadoCad := nil;
end;

procedure TFAtestadoCad.BTLoteSementeConsClick(Sender: TObject);
begin
  inherited;
  with DMAtestado do
  begin
    if FLoteSementeCons = nil then
      FLoteSementeCons:= TFLoteSementeCons.Create(Application);
    if FLoteSementeCons.ShowModal = mrOk then
    begin
      QAtestadoItemCod_Produto.Value:=DMProducaoSemente.QLoteSementeConsCod_Produto.Value;
      QAtestadoItemCod_Plantio_Safra.Value:=DMProducaoSemente.QLoteSementeConsCod_Plantio_Safra.Value;
      QAtestadoItemNum_Lote_Semente.Value:=DMProducaoSemente.QLoteSementeConsNum_Lote_Semente.Value;
    end;
  end;
end;

procedure TFAtestadoCad.BTLaboratorioConsClick(Sender: TObject);
begin
  inherited;
  with DMAtestado do
  begin
    if FMensagemCons = nil then
      FMensagemCons:= TFMensagemCons.Create(Application);
    if FMensagemCons.ShowModal = mrOk then
      QAtestadoCod_Mensagem.Value:=(DMMensagem.QMensagemConsCod_Mensagem.Value);
  end;
end;

procedure TFAtestadoCad.BTFuncionarioConsClick(Sender: TObject);
begin
  inherited;
  with DMAtestado do
  begin
    if FFuncionarioCons = nil then
      FFuncionarioCons:= TFFuncionarioCons.Create(Application);
    if FFuncionarioCons.ShowModal = mrOk then
      QAtestadoCod_Funcionario.Value:=DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
  end;
end;

procedure TFAtestadoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
   If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    FAtestadoCad.BTLaboratorioCons.enabled:=True;
    FAtestadoCad.BTFuncionarioCons.enabled:=True;
  End
  Else
  Begin
    FAtestadoCad.BTLaboratorioCons.enabled:=False;
    FAtestadoCad.BTFuncionarioCons.enabled:=False;
  End;
end;

procedure TFAtestadoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FAtestadoCons = nil then
     FAtestadoCons:= TFAtestadoCons.Create(Application);
   if FAtestadoCons.ShowModal = mrOk then
   begin
     with DMAtestado do
     begin
       QAtestado.Close;
       QAtestado.setVariable('PK',QAtestadoConsCod_Atestado_Cab.value);
       QAtestado.Open;
     end;
   end;
end;

procedure TFAtestadoCad.ImpressoAtestado1Click(Sender: TObject);
var
  wCont:Integer;
begin
  inherited;
  if DMAtestado.QAtestadoCod_Atestado_Cab.Text <> '' then
  begin
    With DMAtestado do
    begin
      QRAtestado.Close;
      QRAtestado.setVariable('PK',QAtestadoCod_Atestado_Cab.Value);
      QRAtestado.Open;

    {  //----cria lote vazio para completar os 10 itens do atestado
      if QRAtestado.recordCount < 10 then
      begin
        wCont:=QRAtestado.recordCount;
        while wCont < 10 do
        begin
          QRAtestado.Append;
          QRAtestadoNum_Lote_Semente.Text:='-0-0-';
          QRAtestadoNUM_BOLETIM.Text:='-0-0-';
          QRAtestadoPERC_PUREZA_SEMENTE.Text:='-0-0-';
          QRAtestadoNum_Lote_Semente.Text:='-0-0-';
          QRAtestadoPERC_GERMINACAO.Text:='-0-0-';
          QRAtestadoDESC_VALIDADE.Text:='-0-0-';
          QRAtestado.Post;
        end;
      end;}

      QCalculaSacas.Close;
      QCalculaSacas.setVariable('COD_ATESTADO_CAB',QRAtestadoCod_Atestado_Cab.Value);
      QCalculaSacas.Open;

      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'AB' then
      begin
        if FRAtestadoSemente = nil then
          FRAtestadoSemente := TFRAtestadoSemente.Create(application);

        FRAtestadoSemente.QRLCultivar.Caption:='Atesto que as sementes de '+QRAtestadoDesc_Cultura.Text+' da cultivar '
              +QRAtestadoDesc_Complemento_2.text+' com '+QCalculaSacasTOTAL_LOTE.text+' ('+Bib.extenso(QCalculaSacasTOTAL_LOTE.Value,'SACA')+' )'
              +' de '+DMOracle.BuscaNome('SELECT TB_PRODUTO.NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+QRAtestadoCOD_PRODUTO.Text)+' KG';
        FRAtestadoSemente.QRLData.Caption:= FormatDateTime(', dd "de" mmmm "de" yyyy',QRAtestadoDt_Emissao.Value);


        FRAtestadoSemente.QRLNumAtestado.Caption:='0'+QRAtestadoNUM_ATESTADO.Text+'/'+Copy(QRAtestadoDesc_Safra.Text,6,4)+'-'+QRAtestadoCod_Estado.Text;
        FRAtestadoSemente.QRPrimario.Preview;
      end
      else
      begin
        if FRAtestadoMoinho = nil then
          FRAtestadoMoinho := TFRAtestadoMoinho.Create(application);

        FRAtestadoMoinho.QRLCultivar.Caption:='Atesto que as sementes de '+QRAtestadoDesc_Cultura.Text+' da cultivar '
              +QRAtestadoDesc_Complemento_2.text+' com '+QCalculaSacasTOTAL_LOTE.text+' ('+Bib.extenso(QCalculaSacasTOTAL_LOTE.Value,'SACA')+' )'
              +' de '+DMOracle.BuscaNome('SELECT TB_PRODUTO.NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+QRAtestadoCOD_PRODUTO.Text)+' KG';
        FRAtestadoMoinho.QRLData.Caption:= FormatDateTime(', dd "de" mmmm "de" yyyy',QRAtestadoDt_Emissao.Value);


        FRAtestadoMoinho.QRLNumAtestado.Caption:='0'+QRAtestadoNUM_ATESTADO.Text+'/'+Copy(QRAtestadoDesc_Safra.Text,6,4)+'-'+QRAtestadoCod_Estado.Text;
        FRAtestadoMoinho.QRPrimario.Preview;
      end;
    end;
  end
  else
    ShowMessage('É necessário escolher um Atestado');
end;

end.
