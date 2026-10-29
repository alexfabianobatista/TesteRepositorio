unit UNotasMarketplace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Mask, OleCtnrs, Buttons, Grids, DBGrids, IdURI,
  UFmCadastro, UFmFilial, ExtCtrls, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, UCarregando2, ShellApi, Clipbrd, UCadastroCons;

type
  TFNotasMarketplace = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    DBGrid1: TDBGrid;
    cbStatus: TComboBox;
    btnPesquisar: TBitBtn;
    OleContainer1: TOleContainer;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    MENumNota: TMaskEdit;
    MECodigoMarketplace: TMaskEdit;
    DsNotasMarketplace: TDataSource;
    MainMenu1: TMainMenu;
    Manuteno1: TMenuItem;
    MIFatura1: TMenuItem;
    MIVerificarStatus1: TMenuItem;
    MICancelar1: TMenuItem;
    Operaes1: TMenuItem;
    MIEtiquetas1: TMenuItem;
    MIConsultarJSON1: TMenuItem;
    IdHTTP1: TIdHTTP;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Finalizar1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Copiarcdigomarketplace1: TMenuItem;
    procedure btnPesquisarClick(Sender: TObject);
    procedure MIFatura1Click(Sender: TObject);
    procedure MIVerificarStatus1Click(Sender: TObject);
    procedure MICancelar1Click(Sender: TObject);
    procedure MIEtiquetas1Click(Sender: TObject);
    procedure MIConsultarJSON1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure Finalizar1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Copiarcdigomarketplace1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FCarregando: TFCarregando2;
    function QualAPI(codPedido : string) : Integer;
    function URLEncode(s: string): string;
  public
    { Public declarations }
  end;

var
  FNotasMarketplace: TFNotasMarketplace;
  FCadastroCons: TFCadastroCons;

implementation

uses UNotasMarketplace_cl, UNotaSaida_cl, UParamSistema_cl, UBiblioteca,
  UMarketplaceDetalhes, Gauges, UOracle_cl;

{$R *.dfm}

procedure TFNotasMarketplace.btnPesquisarClick(Sender: TObject);
begin
  with DMNotasMarketplace do
  begin
    QNotasMarketplace.Close;
    Bib.setVariableOuNull(QNotasMarketplace, 'FILIAL', Trim(FmFilial1.MeFilial.Text));
    Bib.setVariableOuNull(QNotasMarketplace, 'CADASTRO', Trim(FmCadastro1.MeCadastro.Text));
    Bib.setVariableOuNull(QNotasMarketplace, 'DT_INICIAL', Trim(MEDtInicial.Text));
    Bib.setVariableOuNull(QNotasMarketplace, 'DT_FINAL', Trim(MEDtFinal.Text));
    Bib.setVariableOuNull(QNotasMarketplace, 'NUM_NOTA', Trim(MENumNota.Text));
    Bib.setVariableOuNull(QNotasMarketplace, 'MARKETPLACE', Trim(MECodigoMarketplace.Text));
    case cbStatus.ItemIndex of                                                                 
      0: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', '1=1'); //Todos
      1: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE <> ' + QuotedStr('CANCELED') + ' AND PED.DESC_SITUACAO_MARKETPLACE <> ' + QuotedStr('FINALIZADO') + ' AND PED.DESC_SITUACAO_MARKETPLACE <> ' + QuotedStr('DELIVERED')); //Em aberto
      2: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('APPROVED')); //Aprovados
      3: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('INVOICED')); //Faturados
      4: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('SHIPPED')); //Enviados
      5: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('DELIVERED')); //Recebidos
      6: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('CANCELED')); //Cancelados
      7: Bib.setVariableOuNull(QNotasMarketplace, 'SITUACAO', 'PED.DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('FINALIZADO')); //Finalizados
    end;

    QNotasMarketplace.Open;
  end;
end;

procedure TFNotasMarketplace.MIFatura1Click(Sender: TObject);
var
  wLoja : String;
begin
  if DMNotasMarketplace.QNotasMarketplace.RecordCount > 0 then
  begin
    FCarregando.Show;
    Application.ProcessMessages;

    try
      with DMNotasMarketplace do
      begin
        QConfiguracoesSkyhub.Close;
        QConfiguracoesSkyhub.SetVariable('FILIAL', QNotasMarketplaceCOD_FILIAL.Text);
        QConfiguracoesSkyhub.Open;
        QConfiguracoesSkyhub.First;

        if QConfiguracoesSkyhubIND_ATIVO.Text = 'N' then
          raise Exception.Create('Filial não habilitada para faturar');

        if QConfiguracoesSkyhub.RecordCount < 1 then
          raise Exception.Create('Filial não configurada para faturar.');

        if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
          raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.');

        if QualApi(DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text) = 0 then
          wLoja := 'SincronizarSkyhub'
        else
          wLoja := 'SincronizarMLivre';

        if wLoja = 'SincronizarSkyhub' then
          if QNotasMarketplaceDESC_CHAVE_ACESSO.Text = '' then
            raise Exception.Create('Nota fiscal não possui chave de acesso.');
                
        IdHTTP1.Request.ContentType := 'application/json';
        IdHTTP1.Get(URLEncode(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text + '/Api/' + wLoja + '/FaturaPedido?' +
                    'codFilial=' + DMNotasMarketplace.QNotasMarketplaceCOD_FILIAL.Text +
                    '&chaveNFE=' + DMNotasMarketplace.QNotasMarketplaceDESC_CHAVE_ACESSO.Text +
                    '&codMarketplace=' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text));
        IdHTTP1.Disconnect;
        FCarregando.Close;

        QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Value := DMOracle.FastSelect('DESC_SITUACAO_MARKETPLACE','TB_PEDIDO_CAB','COD_PEDIDO_CAB = ' + QuotedStr(QNotasMarketplaceCOD_PEDIDO_CAB.Text));

      end;
    except
      on E: EIdHTTPProtocolException do
      begin  
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MessageDlg('Erro: ' + UTF8Decode(E.ErrorMessage), mtError, [mbOK], 0);
      end;
      on E: Exception do
      begin  
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MessageDlg('Erro ao conectar com o servidor: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TFNotasMarketplace.MIVerificarStatus1Click(Sender: TObject);
var
  wLoja : String;
  wRec : Integer;
begin
  if DMNotasMarketplace.QNotasMarketplace.RecordCount > 0 then
  begin
    FCarregando.Show;
    Application.ProcessMessages;

    try
      with DMNotasMarketplace do
      begin
        QConfiguracoesSkyhub.Close;
        QConfiguracoesSkyhub.SetVariable('FILIAL', QNotasMarketplaceCOD_FILIAL.Text);
        QConfiguracoesSkyhub.Open;
        QConfiguracoesSkyhub.First;

        if QConfiguracoesSkyhubIND_ATIVO.Text = 'N' then
          raise Exception.Create('Configuração não está habilitada.');

        if QConfiguracoesSkyhub.RecordCount < 1 then
          raise Exception.Create('Configuração não foi encontrada.');

        if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
          raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.');  

        if QualApi(DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text) = 0 then
          wLoja := 'SincronizarSkyhub'
        else
          wLoja := 'SincronizarMLivre';

        IdHTTP1.Request.ContentType := 'application/json';
        IdHTTP1.Get(URLEncode(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text + '/Api/' + wLoja + '/SincronizaStatusPedido?' +
                    'codFilial=' + DMNotasMarketplace.QNotasMarketplaceCOD_FILIAL.Text +
                    '&codMarketplace=' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text));
        IdHTTP1.Disconnect;
        FCarregando.Close; 

        QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Value := DMOracle.FastSelect('DESC_SITUACAO_MARKETPLACE','TB_PEDIDO_CAB','COD_PEDIDO_CAB = ' + QuotedStr(QNotasMarketplaceCOD_PEDIDO_CAB.Text));

      end;
    except
      on E: EIdHTTPProtocolException do
      begin
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MessageDlg('Erro: ' + UTF8Decode(E.ErrorMessage), mtError, [mbOK], 0);
      end;
      on E: Exception do
      begin
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MessageDlg('Erro ao conectar com o servidor: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TFNotasMarketplace.MICancelar1Click(Sender: TObject);
var
  wLoja : String;
begin
  if DMNotasMarketplace.QNotasMarketplace.RecordCount > 0 then
  begin
    if Application.MessageBox('Deseja realmente cancelar este pedido?',
                              'Atenção', MB_ICONINFORMATION or MB_YESNO) = IDYES then
    begin
      FCarregando.Show;
      Application.ProcessMessages;

      try
        with DMNotasMarketplace do
        begin
          QConfiguracoesSkyhub.Close;
          QConfiguracoesSkyhub.SetVariable('FILIAL', QNotasMarketplaceCOD_FILIAL.Text);
          QConfiguracoesSkyhub.Open;
          QConfiguracoesSkyhub.First;

          if QConfiguracoesSkyhubIND_ATIVO.Text = 'N' then
            raise Exception.Create('Filial não habilitada para cancelar');


          if QConfiguracoesSkyhub.RecordCount < 1 then
            raise Exception.Create('Filial não configurada para cancelar.');

          if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
            raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.'); 

          if QualApi(DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text) = 0 then
            wLoja := 'SincronizarSkyhub'
          else
            wLoja := 'SincronizarMLivre';

          IdHTTP1.Request.ContentType := 'application/json';
          IdHTTP1.Get(URLEncode(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text + '/Api/' + wLoja + '/CancelaPedido?' +
                      'codFilial=' + DMNotasMarketplace.QNotasMarketplaceCOD_FILIAL.Text +
                      '&codMarketplace=' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text));
          IdHTTP1.Disconnect;
          FCarregando.Close;

          QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Value := DMOracle.FastSelect('DESC_SITUACAO_MARKETPLACE','TB_PEDIDO_CAB','COD_PEDIDO_CAB = ' + QuotedStr(QNotasMarketplaceCOD_PEDIDO_CAB.Text));

        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          IdHTTP1.Disconnect;
          FCarregando.Close;
          MessageDlg('Erro: ' + UTF8Decode(E.ErrorMessage), mtError, [mbOK], 0);
        end;
        on E: Exception do
        begin
          IdHTTP1.Disconnect;
          FCarregando.Close;
          MessageDlg('Erro ao conectar com o servidor: ' + E.Message, mtError, [mbOK], 0);
        end;
      end;
    end;
  end;
end;

procedure TFNotasMarketplace.MIEtiquetas1Click(Sender: TObject);
var
  MyFile: TFileStream;
  fileName : string;
  wPedidoString : TStringArray;
  wLoja : String;
begin
  if DMNotasMarketplace.QNotasMarketplace.RecordCount > 0 then
  begin
    FCarregando.Show;
    Application.ProcessMessages;

    try
      with DMNotasMarketplace do
      begin
        QConfiguracoesSkyhub.Close;
        QConfiguracoesSkyhub.SetVariable('FILIAL', QNotasMarketplaceCOD_FILIAL.Text);
        QConfiguracoesSkyhub.Open;
        QConfiguracoesSkyhub.First;
               
        if QConfiguracoesSkyhub.RecordCount < 1 then
          raise Exception.Create('Configurações não encontradas');

        if QConfiguracoesSkyhubIND_ATIVO.Text = 'N' then
          raise Exception.Create('Configurações desabilitadas');

        if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
          raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.');

        if QualApi(DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text) = 0 then
          wLoja := 'SincronizarSkyhub'
        else
          wLoja := 'SincronizarMLivre';

        wPedidoString := Bib.Split2('-', DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text);

        if (Length(wPedidoString) <> 2) then
          raise Exception.Create('Código do pedido está em um formato diferente. ' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text);

        fileName := GetEnvironmentVariable('TEMP') + '\' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text + '.pdf';
        MyFile := TFileStream.Create(Trim(fileName), fmCreate);
        IdHTTP1.Request.ContentType := 'application/pdf';
        IdHTTP1.Get(URLEncode(Trim(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text) +
                            '/Api/' + wLoja + '/DownloadEtiqueta?' +
                            'codFilial=' + Trim(DMNotasMarketplace.QNotasMarketplaceCOD_FILIAL.Text) +
                            '&codMarketplace=' + wPedidoString[1]), MyFile);
        IdHTTP1.Disconnect;
        
        ShellExecute(Handle,nil,PAnsiChar(fileName),nil,nil,SW_SHOW);

        MyFile.Free;
        FCarregando.Close;
      end;
    except
      on E: EIdHTTPProtocolException do
      begin      
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MyFile.Free;
        MessageDlg('Erro: ' + UTF8Decode(E.ErrorMessage), mtError, [mbOK], 0);
      end;
      on E: Exception do
      begin       
        IdHTTP1.Disconnect;
        FCarregando.Close;              
        MyFile.Free;
        MessageDlg('Erro ao conectar com o servidor: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TFNotasMarketplace.MIConsultarJSON1Click(Sender: TObject);
var
  lResponse : TStringStream;
  wCodMpAux : string;
  wLoja : String;
begin
  if DMNotasMarketplace.QNotasMarketplace.RecordCount > 0 then
  begin
    try
      FCarregando.Show;
      Application.ProcessMessages;

      with DMNotasMarketplace do
      begin
        QConfiguracoesSkyhub.Close;
        QConfiguracoesSkyhub.SetVariable('FILIAL', QNotasMarketplaceCOD_FILIAL.Text);
        QConfiguracoesSkyhub.Open;
        QConfiguracoesSkyhub.First;

        lResponse := TStringStream.Create('');

        if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
          raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.');  

        if QualApi(DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text) = 0 then
          wLoja := 'SincronizarSkyhub'
        else
          wLoja := 'SincronizarMLivre';

        IdHTTP1.Request.ContentType := 'application/json';
        wCodMpAux := URLEncode(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text + '/Api/' + wLoja + '/DetalhesPedido?' +
                    'codFilial=' + DMNotasMarketplace.QNotasMarketplaceCOD_FILIAL.Text +
                    '&codMarketplace=' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text);
        IdHTTP1.Get(wCodMpAux, lResponse);
        IdHTTP1.Disconnect;

        if FMarketplaceDetalhes = nil then
          FMarketplaceDetalhes := TFMarketplaceDetalhes.Create(Application);
        FMarketplaceDetalhes.lbPedido.Caption := 'Pedido:' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_CAB.Text;
        FMarketplaceDetalhes.lbMarketplace.Caption := 'Marketplace: ' + DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text;

        lResponse.Position := 0;

        FMarketplaceDetalhes.memoDetalhes.Text :=  UTF8Decode(lResponse.DataString);
        FCarregando.Close;
        FMarketplaceDetalhes.ShowModal;
      end;
    except
      on E: EIdHTTPProtocolException do
      begin          
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MessageDlg('Não foi possível listar: ' + UTF8Decode(E.ErrorMessage), mtError, [mbOK], 0);
      end;
      on E: Exception do
      begin  
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MessageDlg('Erro ao conectar com o servidor: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

function TFNotasMarketplace.URLEncode(s: string): string;
var
  wAux : string;
begin
  wAux := StringReplace(s,' ','+',[rfReplaceAll]);
  Result := wAux;
end;

procedure TFNotasMarketplace.FormCreate(Sender: TObject);
begin
  if FCarregando = nil then
    FCarregando := TFCarregando2.Create(Application);

  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
end;

procedure TFNotasMarketplace.IdHTTP1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  FCarregando.Gauge1.Progress := AWorkCount;
end;

procedure TFNotasMarketplace.IdHTTP1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
    FCarregando.Gauge1.MaxValue := AWorkCountMax;
    FCarregando.Gauge1.Progress := 0;
end;

procedure TFNotasMarketplace.IdHTTP1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  FCarregando.Gauge1.Progress := FCarregando.Gauge1.MaxValue;
  Sleep(60);
  FCarregando.Gauge1.Progress := 0;
end;

procedure TFNotasMarketplace.Finalizar1Click(Sender: TObject);
begin
  try
    with DMNotasMarketplace do
    begin
      if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text <> 'DELIVERED' then
        raise Exception.Create('Este pedido ainda não foi entregue.');

      DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET ' +
          'DESC_SITUACAO_MARKETPLACE = ' + QuotedStr('FINALIZADO') + ' ' +
          'WHERE COD_PEDIDO_CAB = ' + QuotedStr(QNotasMarketplaceCOD_PEDIDO_CAB.Text));

      QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Value := DMOracle.FastSelect('DESC_SITUACAO_MARKETPLACE','TB_PEDIDO_CAB','COD_PEDIDO_CAB = ' + QuotedStr(QNotasMarketplaceCOD_PEDIDO_CAB.Text));

    end;
  except on E: Exception do
    MessageDlg('Não foi possível alterar status: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFNotasMarketplace.DBGrid1DblClick(Sender: TObject);
begin
  if DMNotasMarketplace.QNotasMarketplace.RecordCount > 0 then
  begin
    with DMNotaSaida do
    begin
      QNotaSaida.Close;
      QNotaSaida.SetVariable('PK',DMNotasMarketplace.QNotasMarketplaceCOD_NOTA_CAB.Text);
      QNotaSaida.Open;
      Close;
    end;
  end;
end;

function TFNotasMarketplace.QualAPI(codPedido: string): Integer;
begin
  if (AnsiPos('Mercado Livre', codPedido) > 0) then
    Result := 1
  else
    Result := 0;
end;

procedure TFNotasMarketplace.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pnt: TPoint;
begin
  if (Button = mbRight) and (DMNotasMarketplace.QNotasMarketplaceCOD_NOTA_CAB.Value > 0) and (GetCursorPos(pnt)) then
  begin
    PopupMenu1.Popup(pnt.X, pnt.Y);
  end;
end;

procedure TFNotasMarketplace.Copiarcdigomarketplace1Click(Sender: TObject);
begin
  Clipboard.AsText := DMNotasMarketplace.QNotasMarketplaceCOD_PEDIDO_MARKETPLACE.Text;  
end;

procedure TFNotasMarketplace.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if DMNotasMarketplace.QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'APPROVED' then
    begin
      DBGrid1.Canvas.Brush.Color := clMaroon;
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMNotasMarketplace.QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'INVOICED' then
    begin
      DBGrid1.Canvas.Brush.Color := clOlive;
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMNotasMarketplace.QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'SHIPPED' then
    begin
      DBGrid1.Canvas.Brush.Color := clNavy;
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMNotasMarketplace.QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'DELIVERED' then
    begin
      DBGrid1.Canvas.Brush.Color := clGreen;
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMNotasMarketplace.QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'CANCELED' then
    begin
      DBGrid1.Canvas.Brush.Color := clPurple;
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMNotasMarketplace.QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'FINALIZADO' then
    begin
      DBGrid1.Canvas.Brush.Color := clWhite;
      DBGrid1.Canvas.Font.Color := clBlack;
    end
    else
    begin
      DBGrid1.Canvas.Brush.Color := clWhite;
      DBGrid1.Canvas.Font.Color := clBlack;
    end;
  end;

  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
