unit UBaixaEstoqueLeitorGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, variants, Grids, DBGrids, MPlayer,
  CPort, StrUtils;

type
  TFBaixaEstoqueLeitorGeral = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEEmbarque: TMaskEdit;
    EdEmbarque: TEdit;
    MENum_Nota: TMaskEdit;
    EdNum_Nota: TEdit;
    mpAlerta: TMediaPlayer;
    DBGPedido: TDBGrid;
    BtConfirmar: TBitBtn;
    BtCancelar: TBitBtn;
    RGCargaConfMotorista: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    EdProduto: TEdit;
    MEProduto: TMaskEdit;
    SpeedButton1: TSpeedButton;
    procedure MEEmbarqueExit(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

   // procedure EdSerieExit(Sender: TObject);
    procedure MENum_NotaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure MEProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    wCodBarras: string;
    wLote: String;
    wTotalPeso: Extended; //Total peso bruto do embarque
  public
  end;

var
  FBaixaEstoqueLeitorGeral: TFBaixaEstoqueLeitorGeral;
  wCodBarras, wPeso: string;

implementation

uses UEmbarque_cl, UOracle_cl, UEstoque_cl, 
  UrEmbarquePedido, UNotaSaida_cl, UEmbarqueParam,
  UBaixaSemEMbarque, UMsgPersonalizadaEmbarque, UPedido_cl, UBiblioteca,
  UProduto_cl, URBaixaEstoqueLeitor;

{$R *.DFM}

procedure TFBaixaEstoqueLeitorGeral.MEEmbarqueExit(Sender: TObject);
begin
  if Trim(MEEmbarque.Text) <> '' then
    with DMEmbarque do
    begin
      QEmbarque.Close;
      QEmbarque.SetVariable('PK', Trim(MeEmbarque.Text));
      QEmbarque.Open;
      EdEmbarque.Text := QEmbarqueNome_Motorista.Value + ' = ' + QEmbarqueDt_Embarque.Text;
      QEmbarque.Close;
      //MEProduto.SetFocus;
      wTotalPeso := StrToFloat('0' + DMOracle.FastSelect('SUM(EB.QT_PESO_EMBARCADO + NVL(P.NUM_EMBALAGEM,0))',
                              'TB_ESTOQUE_EMBARCADO EB, TB_PRODUTO P',
                              'EB.COD_PRODUTO = P.COD_PRODUTO AND EB.COD_EMBARQUE = ' + Trim(MEEmbarque.Text)));
    end;
  //LTotalEmbarcado.Caption := 'Total do Embarque: ' + FloatToStr(wTotalPeso) + ' KG';
end;

procedure TFBaixaEstoqueLeitorGeral.BtConfirmarClick(Sender: TObject);
var
  wRecNo: Integer;
  wPeso: Real;
  wAux, wCodEstoqueEmbarcado: string;
begin
  try
    if (Trim(MeEmbarque.Text) = '') then
    begin
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Informe o Embarque';
      FMsgPersonalizadaEmbarque.ShowModal();
      MEEmbarque.SetFocus;
      exit;
    end;
    if (trim(MeNum_Nota.Text) = '') then
    begin
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Informe o Pedido';
      FMsgPersonalizadaEmbarque.ShowModal();
      MENum_Nota.SetFocus;
      exit;
    end;
    with DMEmbarque do
    try
      QEmbarqueItensPed.Close;
      QEmbarqueItensPed.SetVariable('COD_EMBARQUE',MEEmbarque.Text);
      QEmbarqueItensPed.SetVariable('COD_PRODUTO',MEProduto.Text);
      QEmbarqueItensPed.SetVariable('COD_PEDIDO_CAB', MENum_Nota.Text);
      QEmbarqueItensPed.Open;
      if not QEmbarqueItensPed.Eof then
      begin
        DMOracle.DBCemapa.StartTransaction;
        while not QEmbarqueItensPed.Eof and (wAux <> 'CONFIRMADO') do
        begin
          if(QEmbarqueItensPedQT_PEDIDO.Value <= QEmbarqueItensPedQT_QUANTIDADE_AUX.Value) then
            wAux := 'EMBARCADO'
          else
            wAux := 'CONFIRMADO';
          if ((MEProduto.Text) <> '') then
          begin
            with DMProduto do
              if QProdutoCOD_PRODUTO.Text <> Trim(MEProduto.Text) then
              begin
                QProduto.Close;
                QProduto.SetVariable('PK', MEProduto.Text);
                QProduto.Open;
              end;

            if (wAux = 'EMBARCADO') then
            begin
              if(QEmbarqueItensPed.RecNo = QEmbarqueItensPed.RecordCount) then
              begin
                FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto já foi Embarcado';
                FMsgPersonalizadaEmbarque.ShowModal();
                MEProduto.Text := '';
                MEProduto.SetFocus;
                exit;
              end;
              QEmbarqueItensPed.Next;
              Continue;
            end;
          end;
        end;
        if wAux = 'CONFIRMADO' then
        begin
          wPeso := QEmbarqueItensPedQT_PEDIDO.Value * DMProduto.QProdutoNUM_PESO_BRUTO.Value;
          //Execução de SQLs em lote
          Executador.Limpa;
          Executador.Adiciona('UPDATE TB_PEDIDO_ITEM SET QT_QUANTIDADE_AUX = ' +
            'NVL(QT_QUANTIDADE_AUX,0) + 1' +
            ' WHERE COD_PEDIDO_ITEM = ' + QEmbarqueItensPedCOD_PEDIDO_ITEM.Text);

          wCodEstoqueEmbarcado := DMOracle.BuscaNome('SELECT COD_ESTOQUE_EMBARCADO FROM TB_ESTOQUE_EMBARCADO',
            'DESC_COD_BARRAS = ' + QuotedStr(wCodBarras) + ' AND COD_EMBARQUE = ' + MEEmbarque.Text +
            ' AND COD_PEDIDO_CAB = ' + QEmbarqueItensPedCOD_PEDIDO_CAB.Text);

          if wCodEstoqueEmbarcado = '' then
            Executador.Adiciona('INSERT INTO TB_ESTOQUE_EMBARCADO(COD_ESTOQUE_EMBARCADO,COD_PRODUTO,COD_FILIAL,' +
              'COD_EMBARQUE,QT_EMBARCADO,QT_PESO_EMBARCADO,DT_EMBARQUE, ' +
              'COD_PEDIDO_CAB, DESC_COD_BARRAS) VALUES(SQESTOQUE_EMBARCADO.NEXTVAL,' +
              Trim(MEProduto.Text) + ','+ QEmbarqueItensPedCOD_FILIAL.Text +',' + Trim(MeEmbarque.Text) +
              ',1, ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wPeso)) + ',' +
              QuotedStr(DateToStr(DATE)) + ',' + MENum_Nota.Text + ',' +
              QuotedStr(wCodBarras)+ ')')
          else
            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO SET QT_EMBARCADO = NVL(QT_EMBARCADO,0) + 1,'+
              'QT_PESO_EMBARCADO = NVL(QT_PESO_EMBARCADO,0) + ' + bib.TrocaVirgulaPorPonto( FloatToStr(wPeso)) +
              ' WHERE COD_ESTOQUE_EMBARCADO = '+ wCodEstoqueEmbarcado);

          Executador.Executar(True, False); //Executando tudo de uma vez
          DMEstoque.AtualizaEstoque(-2,
            QEmbarqueItensPedCOD_FILIAL.Value,
            StrToInt(MEProduto.Text),
            StrToInt(wLote),
            -1,
            0,
            0, DMOracle.DataServ);
          wTotalPeso := wTotalPeso + wPeso;
          //Atualizacao de estoque via trigger
        end;
      end
      else
      begin
        FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto não pertence ao Embarque.';
        FMsgPersonalizadaEmbarque.ShowModal();
        MEProduto.Text := '';
        MEProduto.SetFocus;
        Exit;
      end;


      QRBaixaEstoqueLeitor.Close;
      QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', MeEmbarque.Text);
      QRBaixaEstoqueLeitor.SetVariable('COD_PEDIDO', MeNum_Nota.Text);
      QRBaixaEstoqueLeitor.open;
      QRBaixaEstoqueLeitor.Locate('COD_PRODUTO',QEmbarqueItensPedCOD_PRODUTO.Value,[]);

      DMOracle.DBCemapa.Commit;
    except
      on e: Exception do
      begin
        DMOracle.DBCemapa.rollback;
        FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Erro!' + #13 + #10 + e.Message;
        FMsgPersonalizadaEmbarque.ShowModal();
        MEProduto.SetFocus;
        exit;
      end;
    end;

    MeProduto.Text := '';
    MEProduto.SetFocus;
  except
    //Se der exceçao, nao tratar e nem exibir para o usuario. Se não deu certo para atualizar,
    //o sistema já avisa o usuario e trava o leitor automaticamente.
  end;
end;

procedure TFBaixaEstoqueLeitorGeral.MEProdutoExit(Sender: TObject);
begin
  if ((Trim(MEProduto.Text) <> '') and (Length(MeProduto.Text) = 12)) then
  begin
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + Copy(MEProduto.Text, 1, 6));
    wLote := Copy(MeProduto.Text, 7, 6);
    wCodBarras := MEProduto.Text;
    MeProduto.Text := Copy(MeProduto.Text, 1, 6);

    if EdProduto.Text = '' then
    begin
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto ' + meProduto.Text + ' não identificado! Tente novamente';
      FMsgPersonalizadaEmbarque.ShowModal();
      MEProduto.SetFocus;
      exit;
    end;

    BtConfirmarClick(Self);
  end
  else if Trim(MeProduto.Text) <> '' then
  begin
    MEProduto.Text := '';
    MEProduto.SetFocus;
  end;
end;

procedure TFBaixaEstoqueLeitorGeral.SpeedButton1Click(Sender: TObject);
begin
  if (Trim(MEEmbarque.Text) = '') then
    raise Exception.Create('Informe o Embarque!');
  with DMEmbarque do
  begin
    QRBaixaEstoqueLeitor.Close;
    QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', Trim(MeEmbarque.Text));
    QRBaixaEstoqueLeitor.Open;
    if FrBaixaEstoqueLeitor = nil then
      FrBaixaEstoqueLeitor := TFrBaixaEstoqueLeitor.Create(Application);
    FrBaixaEstoqueLeitor.QRLEmbarque.Caption := 'Embarque: ' + (MEEmbarque.Text) + 'Motorista: ' + (EdEmbarque.Text);
    FrBaixaEstoqueLeitor.QRPrimario.Preview;
    QRBaixaEstoqueLeitor.Close;
  end;
end;

procedure TFBaixaEstoqueLeitorGeral.MENum_NotaExit(Sender: TObject);
var
  wEmbarque: integer;
  wCadastro: integer;
begin
  if ((Trim(MeEmbarque.Text) <> '') and (Trim(MENum_Nota.Text) <> '')) then
  begin
    wEmbarque := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM ', 'COD_PEDIDO_CAB =' + MeNum_nota.Text));
    wCadastro := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB', 'COD_PEDIDO_CAB =' + MeNum_Nota.Text));
    if IntToStr(wEmbarque) <> Trim(MEEmbarque.Text) then
      raise Exception.Create('Pedido não pertence a este embarque!')
    else
    begin
      DMEmbarque.QRBaixaEstoqueLeitor.Close;
      DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', MeEmbarque.Text);
      DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('COD_PEDIDO', MeNum_Nota.Text);
      DMEmbarque.QRBaixaEstoqueLeitor.open;
      EdNum_Nota.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO =' + IntToStr(wCadastro));
      MeProduto.SetFocus;
    end;
  end;
end;

procedure TFBaixaEstoqueLeitorGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TFBaixaEstoqueLeitorGeral.FormActivate(Sender: TObject);
begin
  if(Trim(MEEmbarque.Text) = '') then
    MEEmbarque.SetFocus
  else if Trim(MENum_Nota.Text) = '' then
    MENum_Nota.SetFocus
  else
    MEProduto.SetFocus;
end;

procedure TFBaixaEstoqueLeitorGeral.MEProdutoEnter(Sender: TObject);
begin
  MEProduto.SelectAll;
end;

procedure TFBaixaEstoqueLeitorGeral.FormCreate(Sender: TObject);
begin
  wTotalPeso := 0;
  if FMsgPersonalizadaEmbarque = nil then
    FMsgPersonalizadaEmbarque := TFMsgPersonalizadaEmbarque.Create(Application);
end;
end.




