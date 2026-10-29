unit UGrupoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Db, Menus, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, Grids, DBGrids, ImgList, variants, DBPanel, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFGrupoCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    BtAdicionaUsuario: TBitBtn;
    BtRemoverUsuario: TBitBtn;
    TabSheet3: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLCBTela: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    BtInsDireitoGrupo: TBitBtn;
    BtDelDireitoGrupo: TBitBtn;
    RelatriodeSegurana1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    BtInsDireitoGrupoAll: TBitBtn;
    BtDelDireitoGrupoAll: TBitBtn;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtAdicionaUsuarioClick(Sender: TObject);
    procedure BtRemoverUsuarioClick(Sender: TObject);
    procedure BtInsDireitoGrupoClick(Sender: TObject);
    procedure BtDelDireitoGrupoClick(Sender: TObject);
    procedure DBLCBTelaCloseUp(Sender: TObject);
    procedure RelatriodeSegurana1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtInsDireitoGrupoAllClick(Sender: TObject);
    procedure BtDelDireitoGrupoAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoCad: TFGrupoCad;

implementation

uses UGrupo_cl, UGrupoCons, UTelaCons, UOracle_cl, UTela_cl, UUsuarioCons,
  UUsuario_cl, UFuncao_cl, UrRelSeguranca, UGrupoParam;

{$R *.DFM}




procedure TFGrupoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FGrupoCons = Nil then
    FGrupoCons := TFGrupoCons.Create(Application);
  If FGrupoCons.ShowModal = mrOk then
  With DMGrupo do
  Begin
    QGrupo.Close;
    QGrupo.SetVariable('PK',QGrupoConsCod_Grupo.Value);
    QGrupo.Open;
  End;

end;

procedure TFGrupoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    QGrupo.Open;
    QUsuarioGrupo.Open;
    QUsuarioGrupoIns.Open;
    QDireitoGrupoAll.Open;
    QDireitoGrupo.Open;
  End;
  With DMFuncao do
  Begin
    QModulo.Open;
    QTela.Open;
    QFuncao.Open;
  End;
end;

procedure TFGrupoCad.BtAdicionaUsuarioClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = Nil then
    FUsuarioCons := TFUsuariocons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
  With DMGrupo do
  Begin
    Try
      QUsuarioGrupoIns.Insert;
      QUsuarioGrupoInsCod_Usuario.Value := DMUsuario.QUsuarioConsCod_Usuario.Value;
      QUsuarioGrupoInsCod_Grupo.Value := QGrupoCod_Grupo.Value;
      QUsuarioGrupoInsDt_Liberacao.Value := DMOracle.DataServ;
      QUsuarioGrupoIns.Post;
      QUsuarioGrupo.close;
      QUsuarioGrupo.Open;
    Except
      QUsuarioGrupoIns.Cancel;
    End;
  End;
end;

procedure TFGrupoCad.BtRemoverUsuarioClick(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    QUsuarioGrupoIns.Close;
    QUsuarioGrupoIns.SetVariable('COD_USUARIO', QUsuarioGrupoCOD_USUARIO.Value);
    QUsuarioGrupoIns.SetVariable('COD_GRUPO', QUsuarioGrupoCOD_GRUPO.Value);
    QUsuarioGrupoIns.Open;
    QUsuarioGrupoIns.Delete;
    QUsuarioGrupo.Close;
    QUsuarioGrupo.Open;
  End;
end;

procedure TFGrupoCad.BtInsDireitoGrupoClick(Sender: TObject);
begin
  inherited;
  with DMGrupo do
  begin
    if DMGrupo.QGrupoCod_Grupo.Value <= 0 then
       raise exception.Create('Nenhum Grupo Selecionado!');
    if DMFuncao.QFuncaoCod_Funcao.Value <= 0 then
       raise exception.Create('Nenhuma Função Selecionada!');
    try
      QDireitoGrupo.Insert;
      QDireitoGrupoCod_Grupo.Value := DMGrupo.QGrupoCod_Grupo.Value;
      QDireitoGrupoCod_Funcao.Value := DMFuncao.QFuncaoCod_Funcao.Value;
      QDireitoGrupo.Post;
      QDireitoGrupoAll.Close;
      QDireitoGrupoAll.Open;
    except
      if QDireitoGrupo.State = dsInsert then
         QDireitoGrupo.Cancel;
      raise;
    end;
  end;
end;

procedure TFGrupoCad.BtDelDireitoGrupoClick(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    QDireitoGrupo.Close;
    QDireitoGrupo.SetVariable('COD_FUNCAO',QDireitoGrupoAllCod_Funcao.Value);
    QDireitoGrupo.SetVariable('COD_GRUPO',QDireitoGrupoAllCod_Grupo.Value);
    QDireitoGrupo.Open;
    If QDireitoGrupoCod_Funcao.Value <= 0 then
      Abort;
    QDireitoGrupo.Delete;
    QDireitoGrupoAll.Close;
    QDireitoGrupoAll.Open;
  End;
end;

procedure TFGrupoCad.DBLCBTelaCloseUp(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    QDireitoGrupoAll.Close;
    QDireitoGrupoAll.SetVariable('NOME_TELA',DBLCBTela.KeyValue);
    QDireitoGrupoAll.Open;
  End;
end;


procedure TFGrupoCad.RelatriodeSegurana1Click(Sender: TObject);
begin
  inherited;
  //CODIGO COMENTADO POR FABIANO: 06/08/2004
  //POR NAO SER ENCONTRADO A UNIT UGRUPOPARAM


  if FGrupoParam = Nil then
    FGrupoParam := TFGrupoParam.Create(Application);
  FGrupoParam.PGRelatorio.Pages[0].TabVisible := True;
  If FGrupoParam.ShowModal =  mrOk then
   begin
     DMGrupo.QRGrupo_Usuario.Close;
     DMGrupo.QRGrupo_Funcao.Close;
     DMGrupo.QRGrupo.Close;

     If Trim(FGrupoParam.Me0Grupo.Text) <> '' Then
       DMGrupo.QRGrupo.SetVariable('Cod_Grupo',Trim(FGrupoParam.Me0Grupo.Text))
     Else
       DMGrupo.QRGrupo.SetVariable('Cod_Grupo',Null);

     If FRRelSeguranca=Nil then
        FRRelSeguranca:=TFRRelSeguranca.Create(Application);

     if FGrupoParam.RG0Tipo.Itemindex = 1 then
     Begin
       FrRelSeguranca.QrBand4.Enabled := False;
       FrRelSeguranca.QrSubDetail2.Enabled := False;
     end
     else
     Begin
       FrRelSeguranca.QrBand4.Enabled := True;
       FrRelSeguranca.QrSubDetail2.Enabled := True;
     end;
     DMGrupo.QRGrupo.Open;
     DMGrupo.QRGrupo_Usuario.Open;
     DMGrupo.QRGrupo_Funcao.Open;

     FRRelSeguranca.QRPrimario.Preview;
     DMGrupo.QRGrupo.Close;
     DMGrupo.QRGrupo_Usuario.Close;
     DMGrupo.QRGrupo_Funcao.Close;
   End;
end;

procedure TFGrupoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  With DMGrupo do
  Begin
    QGrupo.Open;
    QUsuarioGrupo.Open;
    QUsuarioGrupoIns.Open;
    QDireitoGrupoAll.Open;
    QDireitoGrupo.Open;
  End;
  inherited;
end;

procedure TFGrupoCad.BtInsDireitoGrupoAllClick(Sender: TObject);
begin
  inherited;
  with DMGrupo do
  begin
    if DMGrupo.QGrupoCod_Grupo.Value <= 0 then
       raise exception.Create('Nenhum Grupo Selecionado!');
    if DMFuncao.QFuncaoCod_Funcao.Value <= 0 then
       raise exception.Create('Nenhuma Função Selecionada!');
    try
      DMFuncao.QFuncao.Close;
      DMFuncao.QFuncao.Open;
      DMFuncao.QFuncao.First;
      while not DMFuncao.QFuncao.Eof do
      begin
        try
          QDireitoGrupo.Insert;
          QDireitoGrupoCod_Grupo.Value := DMGrupo.QGrupoCod_Grupo.Value;
          QDireitoGrupoCod_Funcao.Value := DMFuncao.QFuncaoCod_Funcao.Value;
          QDireitoGrupo.Post;
          QDireitoGrupoAll.Close;
          QDireitoGrupoAll.Open;
        except
          QDireitoGrupo.Cancel;
        end;

        DMFuncao.QFuncao.Next;
      end;
    except
      if QDireitoGrupo.State = dsInsert then
         QDireitoGrupo.Cancel;
      raise;
    end;
  end;
end;

procedure TFGrupoCad.BtDelDireitoGrupoAllClick(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    while not QDireitoGrupoAll.Eof do
    begin
      QDireitoGrupo.Close;
      QDireitoGrupo.SetVariable('COD_FUNCAO',QDireitoGrupoAllCod_Funcao.Value);
      QDireitoGrupo.SetVariable('COD_GRUPO',QDireitoGrupoAllCod_Grupo.Value);
      QDireitoGrupo.Open;
      If QDireitoGrupoCod_Funcao.Value <= 0 then
        Abort;
      QDireitoGrupo.Delete;
      QDireitoGrupoAll.Close;
      QDireitoGrupoAll.Open;
    end;
  End;
end;

end.
